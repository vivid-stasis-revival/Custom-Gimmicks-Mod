if (!instance_exists(cc))
    exit;

current_text = text_array[text_array_length - 1][1];

for (i = 0; i < array_length(text_array); i++)
{
    if (text_array[i][0] > cc.currentbeataccurate)
    {
        current_text = text_array[max(i - 1, 0)][1];
        break;
    }
}

textX = variable_instance_get(cc, string("mod_textX_{0}", textID)) + variable_instance_get(cc, string("mod_textX_{0}b", textID));
textY = variable_instance_get(cc, string("mod_textY_{0}", textID)) + variable_instance_get(cc, string("mod_textY_{0}b", textID));
textalp = variable_instance_get(cc, string("mod_textalp_{0}", textID));
textrot = variable_instance_get(cc, string("mod_textrot_{0}", textID));
textcolrgb = variable_instance_get(cc, string("mod_textcolrgb_{0}", textID));
textscale = variable_instance_get(cc, string("mod_textscale_{0}", textID));
textsep = variable_instance_get(cc, string("mod_textsep_{0}", textID));
