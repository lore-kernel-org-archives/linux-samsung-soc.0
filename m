From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: Re: s3c24xx: Use devm_kcalloc() in s3c24xx_dma_probe()
Date: Sun, 23 Apr 2017 14:18:15 +0200
Message-ID: <bb42bc46-cb12-cd32-ecd9-ae9b991b476b@math.uni-bielefeld.de>
References: <930f0a6c-bc5c-3d01-6814-563780fc90ef@users.sourceforge.net>
 <9c10b823-f49b-8c73-2bf8-0fd2b0ba0231@users.sourceforge.net>
 <f1257887-ca14-6415-b1ff-d57190a1810f@math.uni-bielefeld.de>
 <02134825-fec7-73d7-2eb6-b510eaaf3b08@users.sourceforge.net>
 <49f1c0b2-7463-2121-1aed-0998f6635c92@math.uni-bielefeld.de>
 <b89bfd5c-315a-345f-7239-2d6300cf1f6e@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:47169 "EHLO
        smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1045205AbdDWMSS (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 23 Apr 2017 08:18:18 -0400
In-Reply-To: <b89bfd5c-315a-345f-7239-2d6300cf1f6e@users.sourceforge.net>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: SF Markus Elfring <elfring@users.sourceforge.net>, dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Dan Williams <dan.j.williams@intel.com>, Javier Martinez Canillas <javier@osg.samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

SF Markus Elfring wrote:
>>> WARNING: Prefer devm_kcalloc over devm_kzalloc with multiply
>> For example. Also I just noticed some previous comment by Krzysztof that
>> pointed that out already.
>>
>> My suggestion: One sentence describing that the current situation is.
> 
> Why do you find the sentence for the multiplication information inappropriate
> (or incomplete) at the moment?
I already explained that. It's a 1:1 translation of a german sentence
into English. A native speaker does not write or speak like that. If in
doubt, don't use long sentences (with nesting, etc.) at all, and break
things down into logical blocks.


>> Another sentence explaining why this is bad/undesirable.
> 
> Which details do you miss here?
Pretty much everything.


>> In this case, the output of the checkpatch script would come in handy.
> 
> Its implementation of the check “ALLOC_WITH_MULTIPLY” considers only an other
> search pattern so far.
> 
> * Do you find it worthwhile to add a prefix like “devm_” to the used
>   regular expression?
> 
> * Would like to improve any related scripts for the semantic patch language
>   (Coccinelle software) a bit more?
I don't understand why you're asking this. I'm talking about the
_output_ of checkpatch, not about the script itself.

But undoubtedly your patch is motivated by the output of said tool.
Hence you should mention that.

- Tobias


>> With this, you avoid cramming every information into one long and
>> complicated sentence.
> 
> Thanks for your feedback about other wording preferences.
> 
> Regards,
> Markus
> 
