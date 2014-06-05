From: Arun Kumar K <arun.kk@samsung.com>
Subject: Re: [PATCH v2 2/2] s5p-mfc: Adding MFC v7 and v8 firmwares
Date: Thu, 5 Jun 2014 09:54:25 +0530
Message-ID: <CALt3h7_BHLwr2yt2bhO8zwNZh9-Q+qWLxkEfvy_mVzSpoRgMEw@mail.gmail.com>
References: <1400676064-17819-1-git-send-email-arun.kk@samsung.com>
	<1400676064-17819-2-git-send-email-arun.kk@samsung.com>
	<1401824047.2412.7.camel@deadeye.wl.decadent.org.uk>
	<1401837995.2412.45.camel@deadeye.wl.decadent.org.uk>
	<CALt3h7-D1VA5WfyaZDpuOe0L6V2ZhiOsb-wDFx48Nk3-mxBAPA@mail.gmail.com>
	<01f601cf7fe5$5b325fa0$11971ee0$%debski@samsung.com>
	<1401884009.2412.73.camel@deadeye.wl.decadent.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f178.google.com ([209.85.220.178]:49221 "EHLO
	mail-vc0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750921AbaFEEY1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 5 Jun 2014 00:24:27 -0400
Received: by mail-vc0-f178.google.com with SMTP id hy4so513962vcb.23
        for <linux-samsung-soc@vger.kernel.org>; Wed, 04 Jun 2014 21:24:25 -0700 (PDT)
In-Reply-To: <1401884009.2412.73.camel@deadeye.wl.decadent.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ben Hutchings <ben@decadent.org.uk>
Cc: Kamil Debski <k.debski@samsung.com>, David Woodhouse <dwmw2@infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Tomasz Figa <t.figa@samsung.com>, linux-firmware@kernel.org

Hi Ben,

On Wed, Jun 4, 2014 at 5:43 PM, Ben Hutchings <ben@decadent.org.uk> wrote:
> On Wed, 2014-06-04 at 13:08 +0200, Kamil Debski wrote:
>> Hi Arun, Ben,
>>
>>
>> > From: arunkk.samsung@gmail.com [mailto:arunkk.samsung@gmail.com] On
>> > Behalf Of Arun Kumar K
>> > Sent: Wednesday, June 04, 2014 7:32 AM
>> >
>> > Hi Ben,
>> >
>> > On Wed, Jun 4, 2014 at 4:56 AM, Ben Hutchings <ben@decadent.org.uk>
>> > wrote:
>> > > On Tue, 2014-06-03 at 20:34 +0100, Ben Hutchings wrote:
>> > >> On Wed, 2014-05-21 at 18:11 +0530, Arun Kumar K wrote:
>> > >> > Adding the following firmware files for MFC
>> > >> > s5p-mfc-v7.fw: Used in exynos 5420
>> > >> > s5p-mfc-v8.fw: Used in exynos 5800
>> > >> >
>> > >> > Signed-off-by: Arun Kumar K <arun.kk@samsung.com>
>> > >> > ---
>> > >> > Changes from v1
>> > >> > - None
>> > >> > ---
>> > >> >  WHENCE                |    2 ++
>> > >> >  s5p-mfc/s5p-mfc-v7.fw |  Bin 0 -> 382724 bytes
>> > >> > s5p-mfc/s5p-mfc-v8.fw |  Bin 0 -> 360576 bytes
>> > >> >  3 files changed, 2 insertions(+)
>> > >> >  create mode 100644 s5p-mfc/s5p-mfc-v7.fw  create mode 100644
>> > >> > s5p-mfc/s5p-mfc-v8.fw
>> > >> [...]
>> > >>
>> > >> Applied, thanks.
>> > >
>> > > Just noticed a problem with all the s5p-mfc firmware: you are putting
>> > > it in the s5p-mfc subdirectory, so distribution packages will install
>> > > them in /lib/firmware/s5p-mfc.  However, unless I'm mistaken your
>> > > driver requests it with a bare filename (e.g. "s5p-mfc-v7.fw") so it
>> > > won't be found.
>> > >
>> >
>> > Yes this issue is there.
>> > Kamil, are you ok with changing the fw load path to s5p-mfc/s5p-mfc*.fw
>> > in the driver?
>>
>> We have two options here:
>> 1) Change the driver to request s5p-mfc/sp5-mfc-fw*
>> 2) Move the files in the firmware repository
>>
>> I would opt for the second option. The driver was uploaded before the
>> firmware. I see that there are many firmware files in the root folder
>> of the repository
>>
>> Ben, what is your opinion? Which is preferred: creating subdirectories
>> or storing firmware in the root folder?
>
> I prefer subdirectories, but compatibility wins.  So I'll apply the
> following patch if no-one objects.
>
> Ben.
>
> ---
> Subject: Move the s5p-mfc firmware out of its subdirectory
>
> The driver does not include this subdirectory name when requesting
> firmware.
>
> Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
> ---
>  WHENCE                                       |  10 +++++-----
>  s5p-mfc/s5p-mfc-v6-v2.fw => s5p-mfc-v6-v2.fw | Bin
>  s5p-mfc/s5p-mfc-v6.fw => s5p-mfc-v6.fw       | Bin
>  s5p-mfc/s5p-mfc-v7.fw => s5p-mfc-v7.fw       | Bin
>  s5p-mfc/s5p-mfc-v8.fw => s5p-mfc-v8.fw       | Bin
>  s5p-mfc/s5p-mfc.fw => s5p-mfc.fw             | Bin
>  6 files changed, 5 insertions(+), 5 deletions(-)
>  rename s5p-mfc/s5p-mfc-v6-v2.fw => s5p-mfc-v6-v2.fw (100%)
>  rename s5p-mfc/s5p-mfc-v6.fw => s5p-mfc-v6.fw (100%)
>  rename s5p-mfc/s5p-mfc-v7.fw => s5p-mfc-v7.fw (100%)
>  rename s5p-mfc/s5p-mfc-v8.fw => s5p-mfc-v8.fw (100%)
>  rename s5p-mfc/s5p-mfc.fw => s5p-mfc.fw (100%)
>
> diff --git a/WHENCE b/WHENCE
> index 6a64fc2..a172f5f 100644
> --- a/WHENCE
> +++ b/WHENCE
> @@ -2250,11 +2250,11 @@ Licence: Redistributable. See LICENCE.atheros_firmware for details
>
>  Driver: s5p-mfc - Samsung MFC video encoder/decoder driver
>
> -File: s5p-mfc/s5p-mfc.fw
> -File: s5p-mfc/s5p-mfc-v6.fw
> -File: s5p-mfc/s5p-mfc-v6-v2.fw
> -File: s5p-mfc/s5p-mfc-v7.fw
> -File: s5p-mfc/s5p-mfc-v8.fw
> +File: s5p-mfc.fw
> +File: s5p-mfc-v6.fw
> +File: s5p-mfc-v6-v2.fw
> +File: s5p-mfc-v7.fw
> +File: s5p-mfc-v8.fw
>
>  Licence:
>  Samsung grants permission to use and redistribute aforementioned firmware
> diff --git a/s5p-mfc/s5p-mfc-v6-v2.fw b/s5p-mfc-v6-v2.fw
> similarity index 100%
> rename from s5p-mfc/s5p-mfc-v6-v2.fw
> rename to s5p-mfc-v6-v2.fw
> diff --git a/s5p-mfc/s5p-mfc-v6.fw b/s5p-mfc-v6.fw
> similarity index 100%
> rename from s5p-mfc/s5p-mfc-v6.fw
> rename to s5p-mfc-v6.fw
> diff --git a/s5p-mfc/s5p-mfc-v7.fw b/s5p-mfc-v7.fw
> similarity index 100%
> rename from s5p-mfc/s5p-mfc-v7.fw
> rename to s5p-mfc-v7.fw
> diff --git a/s5p-mfc/s5p-mfc-v8.fw b/s5p-mfc-v8.fw
> similarity index 100%
> rename from s5p-mfc/s5p-mfc-v8.fw
> rename to s5p-mfc-v8.fw
> diff --git a/s5p-mfc/s5p-mfc.fw b/s5p-mfc.fw
> similarity index 100%
> rename from s5p-mfc/s5p-mfc.fw
> rename to s5p-mfc.fw
>
>

Looks good to me.

Regards
Arun

> --
> Ben Hutchings
> Experience is what causes a person to make new mistakes instead of old ones.
