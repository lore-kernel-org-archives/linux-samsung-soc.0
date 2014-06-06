From: Doug Anderson <dianders@google.com>
Subject: Re: Problems booting exynos5420 with >1 CPU
Date: Fri, 6 Jun 2014 14:44:59 -0700
Message-ID: <CAD=FV=Xbu6hV66Eewev2261xoSrtqj22fXYf1VXyin=WBcDerQ@mail.gmail.com>
References: <CAD=FV=UX90hgyojW3k_kpT=mt8eX9=AyHr+AGjhK=MrE1hHbUA@mail.gmail.com>
	<539145B4.5000200@gmail.com>
	<CAD=FV=XqwEQNJmij-4Gh62OY+B66AjdQjZC0=f_6tbot3UfQaA@mail.gmail.com>
	<CAM4voaknx3+X4O8MUwaruUFPyquY8Opq61ucKX08xTrv8PqfLg@mail.gmail.com>
	<CAD=FV=Vo1JR6n496Q3FqXjRBkbTBRg89_fJQNsqeRx8WQW_a9w@mail.gmail.com>
	<CAM4voakAMN4jdAZDPz55tnc3woZDieZ5aL3TVU2kYsNHT+AMqg@mail.gmail.com>
	<CAD=FV=UjmN5AwWMPy7mQt-J4A_niO8Ug4r15Ez2ZWPT1g3L=VA@mail.gmail.com>
	<CAM4voa=1FY5bfk095BU=3X=vzqjnCSfdLoXpCix5tOwDgOoioQ@mail.gmail.com>
	<CAD=FV=UwgPQVm_KvHbpoJNs-5EtpyaYJ2rp2f-466uhnob=ixA@mail.gmail.com>
	<CAM4voa=cTbobQHi+sBOCy_CDYAnQ6CsvvuoE7XwqFZV_E3gEbQ@mail.gmail.com>
	<CAD=FV=U6HuQj3MxZ-yF-MYdjzqjT5bu=K26JuHZP1hjJzkSqbg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ve0-f172.google.com ([209.85.128.172]:33454 "EHLO
	mail-ve0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752449AbaFFVpA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 6 Jun 2014 17:45:00 -0400
Received: by mail-ve0-f172.google.com with SMTP id oz11so4035223veb.31
        for <linux-samsung-soc@vger.kernel.org>; Fri, 06 Jun 2014 14:44:59 -0700 (PDT)
In-Reply-To: <CAD=FV=U6HuQj3MxZ-yF-MYdjzqjT5bu=K26JuHZP1hjJzkSqbg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Abhilash Kesavan <kesavan.abhilash@gmail.com>
Cc: Tushar Behera <trblinux@gmail.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "Turquette, Mike" <mturquette@linaro.org>, Kevin Hilman <khilman@linaro.org>, Thomas Abraham <thomas.abraham@linaro.org>, Arun Kumar <arun.kk@samsung.com>, Olof Johansson <olof@lixom.net>, Sonny Rao <sonnyrao@chromium.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Andrew Bresticker <abrestic@chromium.org>

Hi,

On Fri, Jun 6, 2014 at 1:49 PM, Doug Anderson <dianders@google.com> wrote:
>> Are you talking about the re-writing the mcpm entry point address post-resume ?
>
> Or even (as Andrew points out) just don't use it.
>
> This works and IMHO is much cleaner because it totally removes the
> U-Boot dependency.  I'll cleanup to not be so insane and post:

The less insane version is at
<https://patchwork.kernel.org/patch/4313611/>.  Thanks to Andrew for
the suggestion!

-Doug
