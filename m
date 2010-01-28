From: jassi brar <jassisinghbrar@gmail.com>
Subject: Re: Problems with device compilation by subsystem config
Date: Thu, 28 Jan 2010 16:27:54 +0900
Message-ID: <1b68c6791001272327y79b6cc98g56ddcdf015766c36@mail.gmail.com>
References: <20100128070518.GS10014@trinity.fluff.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vw0-f46.google.com ([209.85.212.46]:55151 "EHLO
	mail-vw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752637Ab0A1H1z (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 28 Jan 2010 02:27:55 -0500
Received: by vws12 with SMTP id 12so111077vws.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Jan 2010 23:27:54 -0800 (PST)
In-Reply-To: <20100128070518.GS10014@trinity.fluff.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ben Dooks <ben-linux@fluff.org>
Cc: linux-arm-kernel@lists.infradead.org, Linux Samsung SoC <linux-samsung-soc@vger.kernel.org>, Mark Brown <broonie@opensource.wolfsonmicro.com>

On Thu, Jan 28, 2010 at 4:05 PM, Ben Dooks <ben-linux@fluff.org> wrote:
> To fix thsi I propose changing the SPI and Audio support to have their
> own 'config S3C_DEV_xxx' entries which are selected by the boards that
> use them (this removes the need for #ifdef in the board file) and these
> entries should not be dependant on the subsytem defines.
I see the point.
I am preparing patches for new machine selectable config options for SPI and
AUDIO (even though I am not the original author of dev-audio.c but Mark
can always NAK the patch if he disagrees)
