From: Padma Venkat <padma.kvr@gmail.com>
Subject: Re: [PATCH V3 1/7] ARM: dts: Change i2s compatible string on exynos5250
Date: Wed, 7 Aug 2013 16:02:16 +0530
Message-ID: <CAAgF-Bcezj+QGm78Xpm2ahnMrZMqpcnLJaB5bbFyxJDGMTMrpA@mail.gmail.com>
References: <1375866616-5541-1-git-send-email-padma.v@samsung.com>
	<1375866616-5541-2-git-send-email-padma.v@samsung.com>
	<20130807101057.GY6427@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f177.google.com ([209.85.214.177]:50625 "EHLO
	mail-ob0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757220Ab3HGKcQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 7 Aug 2013 06:32:16 -0400
In-Reply-To: <20130807101057.GY6427@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Padmavathi Venna <padma.v@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, devicetree@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, abrestic@chromium.org

Hi Mark,

On Wed, Aug 7, 2013 at 3:40 PM, Mark Brown <broonie@kernel.org> wrote:
> On Wed, Aug 07, 2013 at 02:40:10PM +0530, Padmavathi Venna wrote:
>> This patch removes quirks from i2s node and change the i2s
>> compatible names.
>
> This needs to go along with the driver change otherwise we break
> bisection.

some of the patches at dts side are dependent on this patch. So I
separated it into another set. Should I re-post this patch along with
other driver side patches?

Thanks
Padma
