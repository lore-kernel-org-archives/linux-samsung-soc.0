From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: Re: [PATCH] drm/exynos: Print kernel pointers in a restricted form
Date: Tue, 14 Mar 2017 20:17:35 +0100
Message-ID: <de5e8583-748b-9df2-f7cc-c1b4fb499d17@math.uni-bielefeld.de>
References: <20170314183804.13788-1-krzk@kernel.org>
 <e1800491-0b60-74d1-1377-756d5b0bb371@math.uni-bielefeld.de>
 <20170314190859.y55wlc4z7xdsbbxg@kozik-lap>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:37511 "EHLO
        smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1750861AbdCNTRi (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 14 Mar 2017 15:17:38 -0400
In-Reply-To: <20170314190859.y55wlc4z7xdsbbxg@kozik-lap>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Cc: Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@linux.ie>, Kukjin Kim <kgene@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

Krzysztof Kozlowski wrote:
> On Tue, Mar 14, 2017 at 08:01:41PM +0100, Tobias Jakobi wrote:
>> Hello Krzysztof,
>>
>> I was wondering about the benefit of this. From a quick look these are
>> all messages that end up in the kernel log / dmesg.
>>
>> IIRC %pK does nothing there, since dmest_restrict is supposed to be used
>> to deny an unpriviliged user the access to the kernel log.
>>
>> Or am I missing something here?
> 
> These are regular printks so depending on kernel options (e.g. dynamic
> debug, drm.debug) these might be printed also in the console. Of course
> we could argue then if access to one of the consoles is worth
> securing.
This here suggests otherwise.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/sysctl/kernel.txt#n388

I have not tested this, but IIRC %pK is not honored by the kernel
logging infrastucture. That's why dmesg_restrict is there.

Correct me if I'm wrong.

- Tobias


> Actually, I think that we should get rid of printing of these kernel
> pointers entirely...
> 
> 
> Best regards,
> Krzysztof
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
