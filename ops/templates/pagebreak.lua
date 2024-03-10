--- Return a block element causing a page break in the given format.
local function newpage(format)
  if format == 'docx' then
    local pagebreak = '<w:p><w:r><w:br w:type="page"/></w:r></w:p>'
    return pandoc.RawBlock('openxml', pagebreak)
  elseif format:match 'html.*' then
    return pandoc.RawBlock('html', '<div style=""></div>')
  elseif format:match 'tex$' then
    return pandoc.RawBlock('tex', '\\newpage{}')
  elseif format:match 'epub' then
    local pagebreak = '<p style="page-break-after: always;"> </p>'
    return pandoc.RawBlock('html', pagebreak)
  else
    return pandoc.Para{pandoc.Str '\f'}
  end
end

local function clearpage(format)
  if format == 'docx' then
    local pagebreak = '<w:p><w:r><w:br w:type="page"/></w:r></w:p>'
    return pandoc.RawBlock('openxml', pagebreak)
  elseif format:match 'html.*' then
    return pandoc.RawBlock('html', '<div style=""></div>')
  elseif format:match 'tex$' then
    return pandoc.RawBlock('tex', '\\clearpage{}')
  elseif format:match 'epub' then
    local pagebreak = '<p style="page-break-after: always;"> </p>'
    return pandoc.RawBlock('html', pagebreak)
  else
    return pandoc.Para{pandoc.Str '\f'}
  end
end

function RawBlock (el)

  if el.text:match '\\newpage' then
    return newpage(FORMAT)
  end

  if el.text:match '\\clearpage' then
    return clearpage(FORMAT)
  end
  -- otherwise, leave the block unchanged
  return nil
end
