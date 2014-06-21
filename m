From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH 2/2] ARM: dts: Sort nodes within Peach-pit/Peach-pi dts
 files
Date: Sat, 21 Jun 2014 21:51:32 +0900
Message-ID: <53A57FD4.7050003@samsung.com>
References: <1403252419-28352-1-git-send-email-tushar.b@samsung.com>	<1403252419-28352-3-git-send-email-tushar.b@samsung.com> <CAD=FV=X1EJ4HFQcSR2nBZTnmpOaKRkEy04d21LBSKS3Vj1XAUA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f181.google.com ([209.85.192.181]:38965 "EHLO
	mail-pd0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758234AbaFUMvi (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 21 Jun 2014 08:51:38 -0400
Received: by mail-pd0-f181.google.com with SMTP id v10so3885687pde.26
        for <linux-samsung-soc@vger.kernel.org>; Sat, 21 Jun 2014 05:51:37 -0700 (PDT)
In-Reply-To: <CAD=FV=X1EJ4HFQcSR2nBZTnmpOaKRkEy04d21LBSKS3Vj1XAUA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: Tushar Behera <tushar.b@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "broonie@kernel.org" <broonie@kernel.org>, Tushar Behera <trblinux@gmail.com>

On 06/21/14 05:09, Doug Anderson wrote:
> Tushar / Kukjin,
>
> On Fri, Jun 20, 2014 at 1:20 AM, Tushar Behera<tushar.b@samsung.com>  wrote:
>> Peach-pit and Peach-pi boards are almost similar, hence the DTS file
>> is also very similar. Sorting nodes in both these files will allow
>> us to figure out the difference easily.
>>
>> All the node aliases are sorted in alphabetically increasing order.
>> There is no functional change with this patch.
>>
>> Signed-off-by: Tushar Behera<tushar.b@samsung.com>
>> ---
>>   arch/arm/boot/dts/exynos5420-peach-pit.dts |  236 ++++++++++++++--------------
>>   arch/arm/boot/dts/exynos5800-peach-pi.dts  |  225 +++++++++++++-------------
>>   2 files changed, 233 insertions(+), 228 deletions(-)
>
> Thanks, this looks much better.  I tried against next-20140620 and it
> applied cleanly, gave a good diff between pit and pi, and looked sane.
>
> This is gonna be a pain in the butt if Kukjin doesn't apply it ASAP.
> It will conflict with every single other dts patch to pi.
>
So I've applied both in my tree just now ;-)

> Reviewed-by: Doug Anderson<dianders@chromium.org>

Thanks for your review.

- Kukjin
