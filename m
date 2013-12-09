From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH 2/2] ARM: dts:Move fifo-depth property from cros5250-common.dtsi
Date: Mon, 9 Dec 2013 08:19:30 -0800
Message-ID: <CAD=FV=Vg5Zfw8ABB_1CT9p7qhfi4Mm4pkjd8T==aN=2St4x5=w@mail.gmail.com>
References: <1386571118-17793-1-git-send-email-yuvaraj.cd@samsung.com>
	<1386571118-17793-2-git-send-email-yuvaraj.cd@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vb0-f42.google.com ([209.85.212.42]:54565 "EHLO
	mail-vb0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932812Ab3LIQTb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 9 Dec 2013 11:19:31 -0500
Received: by mail-vb0-f42.google.com with SMTP id w5so683715vbf.15
        for <linux-samsung-soc@vger.kernel.org>; Mon, 09 Dec 2013 08:19:30 -0800 (PST)
In-Reply-To: <1386571118-17793-2-git-send-email-yuvaraj.cd@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Yuvaraj Kumar C D <yuvaraj.cd@gmail.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Rob Herring <rob.herring@calxeda.com>, pawel.moll@arm.com, mark.rutland@arm.com, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ian.campbell@citrix.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Abhilash Kesavan <a.kesavan@samsung.com>, Tomasz Figa <t.figa@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, Sonny Rao <sonnyrao@chromium.org>, Yuvaraj Kumar C D <yuvaraj.cd@samsung.com>

Yuvaraj,

On Sun, Dec 8, 2013 at 10:38 PM, Yuvaraj Kumar C D <yuvaraj.cd@gmail.com> wrote:
> Commit 64c138a ("ARM: dts: Move fifo-depth property from exynos5250
> board dts") missed out handling the exynos5250 snow dts file.
> Deletes the fifo-depth property, as this property has been moved to
> SOC specific exynos5250.dtsi file.
>
> Signed-off-by : Abhilash Kesavan <a.kesavan@samsung.com>
>
> Signed-off-by: Yuvaraj Kumar C D <yuvaraj.cd@samsung.com>

Reviewed-by: Doug Anderson <dianders@chromium.org>
