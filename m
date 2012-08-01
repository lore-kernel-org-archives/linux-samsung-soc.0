From: Padma Venkat <padma.kvr@gmail.com>
Subject: Re: [alsa-devel] [PATCH 1/2] ASOC: SAMSUNG: Add DT support for i2s
Date: Wed, 1 Aug 2012 18:42:03 +0530
Message-ID: <CAAgF-Bf7kJeA6gdy7Ri_bA8AHxSWwp5i8Tv0pWSXumebM5NX7g@mail.gmail.com>
References: <1343218170-30483-1-git-send-email-padma.v@samsung.com>
	<1343218170-30483-2-git-send-email-padma.v@samsung.com>
	<08da01cd6fbf$cd9b5c00$68d21400$@com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lpp01m010-f46.google.com ([209.85.215.46]:34173 "EHLO
	mail-lpp01m010-f46.google.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751356Ab2HANMF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 1 Aug 2012 09:12:05 -0400
Received: by lahd3 with SMTP id d3so4647731lah.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 01 Aug 2012 06:12:03 -0700 (PDT)
In-Reply-To: <08da01cd6fbf$cd9b5c00$68d21400$@com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sangbeom Kim <sbkim73@samsung.com>
Cc: Padmavathi Venna <padma.v@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, rcsekar@samsung.com, sangsu4u.park@samsung.com, joshi@samsung.com, thutt@chromium.org, ben-linux@fluff.org, olofj@google.com

Hi,
On Wed, Aug 1, 2012 at 1:59 PM, Sangbeom Kim <sbkim73@samsung.com> wrote:
> Hi,
> On Wednesday, July 25, 2012 9:09 PM, Padmavathi Venna wrote:
>
>> Add support for device based discovery.
>>
> Currently, I'm reviewing your patch set.
> Your patch can support device tree for Samsung's i2s.
> But I wonder that Your patch can support non-dt too,
> So, Please test your patch on non-dt environment.
> It looks unclear handling of clock source.
> After code review, I will give you more detail comments,
Okey. I will test these patches in non-dt environment.
>
> Thanks,
> Sangbeom.
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
