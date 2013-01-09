From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH 1/5 v2] Rename s5p-time to samsung-time
Date: Wed, 09 Jan 2013 11:26:23 -0800
Message-ID: <50EDC45F.5010105@samsung.com>
References: <50885608.1030503@openwide.fr> <201212101359.51974.heiko@sntech.de> <50CCEEE7.4090203@openwide.fr> <6825637.7rn5o5FT8e@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vb0-f50.google.com ([209.85.212.50]:53920 "EHLO
	mail-vb0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932451Ab3AIT0c (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 9 Jan 2013 14:26:32 -0500
Received: by mail-vb0-f50.google.com with SMTP id ft2so1918089vbb.37
        for <linux-samsung-soc@vger.kernel.org>; Wed, 09 Jan 2013 11:26:31 -0800 (PST)
In-Reply-To: <6825637.7rn5o5FT8e@flatron>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Romain Naour <romain.naour@openwide.fr>, =?ISO-8859-1?Q?Heiko_St=FC?= =?ISO-8859-1?Q?bner?= <heiko@sntech.de>, Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, 'Sylwester Nawrocki' <sylvester.nawrocki@gmail.com>

On 01/08/13 13:00, Tomasz Figa wrote:
> Hi Romain,

[...]

>> What's wrong with this part of the patch ?
>> I applied this patch today on linux-next tree, branch next-20121214.
>> (with some hunk but no error)
>
> Patches that are supposed to go through Samsung (Kgene's) tree, should be
> based on for-next branch of Samsung tree.
>
> Do you have plans to rebase and resubmit this series again? I plan to
> submit some patches for S3C64xx (partly based on my historical work on
> this platform) and would be nice to have hrtime support already there,
> especially when all left is to just merge it.
>
Tomasz, thanks.

As I said, this looks good to me, but, please re-submit this series 
against on latest my for-next so that I can pick up in Samsung tree. I 
couldn't apply due to too many conflicts :-(

One more note, please add config option and inclusion by alphabetical 
order rather than just replacing them.

Thanks.

- Kukjin
