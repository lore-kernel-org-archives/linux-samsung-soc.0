From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v6 00/10] ARM: dts: exynos: Prepare Spring
Date: Fri, 1 Aug 2014 21:57:42 -0700
Message-ID: <CAD=FV=V_vXZLMaTMFdgr62=zRXucZA6D3PvS0Mb40he0ShHTfA@mail.gmail.com>
References: <1406940750-15880-1-git-send-email-afaerber@suse.de>
	<53DC4E41.4050200@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f173.google.com ([209.85.220.173]:62293 "EHLO
	mail-vc0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750734AbaHBE5n convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 2 Aug 2014 00:57:43 -0400
Received: by mail-vc0-f173.google.com with SMTP id hy10so8119876vcb.18
        for <linux-samsung-soc@vger.kernel.org>; Fri, 01 Aug 2014 21:57:42 -0700 (PDT)
In-Reply-To: <53DC4E41.4050200@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Stephan van Schaik <stephan@synkhronix.com>, Vincent Palatin <vpalatin@chromium.org>, Tomasz Figa <t.figa@samsung.com>

Hi,

On Fri, Aug 1, 2014 at 7:34 PM, Javier Martinez Canillas
<javier.martinez@collabora.co.uk> wrote:
> Hello Andreas
>
> On 08/02/2014 02:52 AM, Andreas F=C3=A4rber wrote:
>>
>> Based on the preinstalled 3.8 based ChromeOS kernel and previous 3.1=
5
>> based attempts by Stephan and me that broke for 3.16, I've prepared =
a
>> device tree for the HP Chromebook 11 aka Google Spring.
>>
>> v6 renames a node and reverts dp_hpd.
>>
>> Not yet enabled are trackpad, Wifi and sound.
>>
>> My rebasing branch for testing is here:
>> https://github.com/afaerber/linux/commits/spring-next
>>
>> Regards,
>> Andreas
>>
>
> I made a comment on patch 05/10 but the rest of the series looks good=
 to me. So
> for the remaining patches:
>
> Reviewed-by: Javier Martinez Canillas <javier.martinez@collabora.co.u=
k>
>
> NOTE: I thought that Tomasz Figa gave you his Reviewed-by on v5 for t=
he whole
> series as well but I didn't see his tag on the v6 patches.

Yes, I thought that too.  I assume he's OK with the small changes you
made between v5 and v6.  In the very least his Reviewed-by could be
present on the patches that didn't change between the last two revs.

Given Javier's review and Tomasz's review and Vincent's comments, I'll
probably skip all the work of reviewing the rest of the series unless
someone really wants me to.  ;)

-Doug
