From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: Re: s3c24xx: Use devm_kcalloc() in s3c24xx_dma_probe()
Date: Sun, 23 Apr 2017 12:38:42 +0200
Message-ID: <02134825-fec7-73d7-2eb6-b510eaaf3b08@users.sourceforge.net>
References: <930f0a6c-bc5c-3d01-6814-563780fc90ef@users.sourceforge.net>
 <9c10b823-f49b-8c73-2bf8-0fd2b0ba0231@users.sourceforge.net>
 <f1257887-ca14-6415-b1ff-d57190a1810f@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.15.4]:62323 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1045072AbdDWKja (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 23 Apr 2017 06:39:30 -0400
In-Reply-To: <f1257887-ca14-6415-b1ff-d57190a1810f@math.uni-bielefeld.de>
Content-Language: en-GB
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Dan Williams <dan.j.williams@intel.com>, Javier Martinez Canillas <javier@osg.samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

>> * A multiplication for the size determination of a memory allocation
>>   indicated that an array data structure should be processed.
>>   Thus use the corresponding function "devm_kcalloc".
> I have trouble parsing that sentences. This looks like the typical
> approach of native german speakers to directly transfer sentence
> constructions from German to English. Which, in most cases, doesn't work
> or is just plain confusing.

Do you find the following wording better to understand
if it would be presented by a script like “checkpatch.pl”?

WARNING: Prefer devm_kcalloc over devm_kzalloc with multiply


Regards,
Markus
