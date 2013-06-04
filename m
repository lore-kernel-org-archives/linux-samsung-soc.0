From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH V5 3/5] ARM: dts: add Exynos audio subsystem clock
 controller node
Date: Tue, 4 Jun 2013 10:10:41 -0700
Message-ID: <CAD=FV=V36N87t0YhfPgUk8n3D4j1tNDuO3nHqgW3N4_17rjMSg@mail.gmail.com>
References: <1370348890-6645-1-git-send-email-padma.v@samsung.com>
	<1370348890-6645-4-git-send-email-padma.v@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-la0-f44.google.com ([209.85.215.44]:47458 "EHLO
	mail-la0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751059Ab3FDRKn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 4 Jun 2013 13:10:43 -0400
Received: by mail-la0-f44.google.com with SMTP id er20so501379lab.17
        for <linux-samsung-soc@vger.kernel.org>; Tue, 04 Jun 2013 10:10:42 -0700 (PDT)
In-Reply-To: <1370348890-6645-4-git-send-email-padma.v@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Padmavathi Venna <padma.v@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, alsa-devel@alsa-project.org, Padma Venkat <padma.kvr@gmail.com>, sbkim73@samsung.com, Kukjin Kim <kgene.kim@samsung.com>, "broonie@kernel.org" <broonie@kernel.org>, Mike Turquette <mturquette@linaro.org>

Padmavathi,

On Tue, Jun 4, 2013 at 5:28 AM, Padmavathi Venna <padma.v@samsung.com> wrote:
> Audio subsystem introduced in s5pv210 and exynos platforms
> which has a internal clock controller. This patch adds a node
> for the same on exynos5250.
>
> Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
> Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
>  arch/arm/boot/dts/exynos5250.dtsi |    6 ++++++
>  1 files changed, 6 insertions(+), 0 deletions(-)

Responded on patch set 4 already, but this is the same.  I'm happy with this.

Reviewed-by: Doug Anderson <dianders@chromium.org>
