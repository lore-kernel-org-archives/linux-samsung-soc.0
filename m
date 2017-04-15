From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: Re: regulator: s2mps11: Use kcalloc() in s2mps11_pmic_probe()
Date: Sat, 15 Apr 2017 19:29:23 +0200
Message-ID: <5fbe1743-2d68-4959-d71d-ed9dfca69eb5@users.sourceforge.net>
References: <b0fc50c2-4552-93d1-1ae0-42f78d255fe9@users.sourceforge.net>
 <542252e0-817f-ce13-fbd5-8fd8dda4c746@users.sourceforge.net>
 <20170415104845.bofxl34wr7z7khix@kozik-lap>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.15.14]:60627 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751364AbdDOR3o (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 15 Apr 2017 13:29:44 -0400
In-Reply-To: <20170415104845.bofxl34wr7z7khix@kozik-lap>
Content-Language: en-GB
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Sangbeom Kim <sbkim73@samsung.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

>> A multiplication for the size determination of a memory allocation
>> indicated that an array data structure should be processed.
>> Thus use the corresponding function "kcalloc".
>>
>> This issue was detected by using the Coccinelle software.
> 
> Unfortunately you write mostly cryptic commit messages.

Thanks for your feedback.


> This does not answer for the main question - why this change is needed.

My update suggestion affects an aspect for the coding style.


> Code looks okay,

There can be different opinions about related implementation details.


> but you should explain in simple words why this is needed.

Do you find the following wording from the script “checkpatch.pl”
better to understand?

WARNING: Prefer kcalloc over kzalloc with multiply


Regards,
Markus
