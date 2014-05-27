From: Ulf Hansson <ulf.hansson@linaro.org>
Subject: Re: [PATCHv2 3/3] ARM: dts: replace the broken-cd property into slot
 node for dwmmc.
Date: Tue, 27 May 2014 12:38:01 +0200
Message-ID: <CAPDyKFp_aKQNah=GTjXiWOFmjeTj+cNw1f7bj__8W7wj4Q8a_g@mail.gmail.com>
References: <1401104107-17651-1-git-send-email-jh80.chung@samsung.com>
	<1401104107-17651-4-git-send-email-jh80.chung@samsung.com>
	<002f01cf7990$fb20b530$f1621f90$%jun@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qc0-f172.google.com ([209.85.216.172]:61687 "EHLO
	mail-qc0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751655AbaE0KiC (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 27 May 2014 06:38:02 -0400
Received: by mail-qc0-f172.google.com with SMTP id l6so13668624qcy.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 27 May 2014 03:38:01 -0700 (PDT)
In-Reply-To: <002f01cf7990$fb20b530$f1621f90$%jun@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Seungwon Jeon <tgih.jun@samsung.com>, Jaehoon Chung <jh80.chung@samsung.com>
Cc: linux-mmc <linux-mmc@vger.kernel.org>, Chris Ball <chris@printf.net>, Ludovic Desroches <ludovic.desroches@atmel.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, cpgs@samsung.com

On 27 May 2014 11:49, Seungwon Jeon <tgih.jun@samsung.com> wrote:
> Can this be merged with your another patch, " [PATCH 2/5] mmc: dw_mmc: remove the "supports-highspeed" property."?

Normally devicetree people don't like us to remove DT bindings.

In principle you need to support them forever once added. Still you
should update the DTS files to use the new bindings and mark the old
ones as deprecated in the documentation. I am not sure if this
approach has changed though!?

Kind regards
Ulf Hansson
