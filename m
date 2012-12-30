From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH 0/2] Add missing fixed regulators on Origen board
Date: Sat, 29 Dec 2012 22:25:52 -0800
Message-ID: <CAOesGMi_bmm9ZpiMzVHN=YUmsLSvyiUyvKRq5DxDmxnMu+Z-tQ@mail.gmail.com>
References: <1356683670-30451-1-git-send-email-tushar.behera@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ia0-f179.google.com ([209.85.210.179]:62602 "EHLO
	mail-ia0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751328Ab2L3GZw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 30 Dec 2012 01:25:52 -0500
Received: by mail-ia0-f179.google.com with SMTP id o25so9910128iad.10
        for <linux-samsung-soc@vger.kernel.org>; Sat, 29 Dec 2012 22:25:52 -0800 (PST)
In-Reply-To: <1356683670-30451-1-git-send-email-tushar.behera@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tushar Behera <tushar.behera@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com

Hi,

On Fri, Dec 28, 2012 at 12:34 AM, Tushar Behera
<tushar.behera@linaro.org> wrote:
> This patchset adds vmmc and hdmi-en regulators for Origen board.
>
> Tushar Behera (2):
>   ARM: EXYNOS: Add vmmc regulator for Origen board
>   ARM: EXYNOS: Add hdmi-en regulator for Origen board

The vmmc one seems to already be there in the dts file for origen. It
looks like the HDMI one is still needed though.

Please move to using DT board files instead of expanding the legacy board files.


-Olof
