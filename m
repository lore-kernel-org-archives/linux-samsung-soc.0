From: Anca Emanuel <anca.emanuel@gmail.com>
Subject: Re: [PATCH v6 09/10] ARM: S5PC100: Modify platform data for pl330 driver
Date: Wed, 12 Oct 2011 07:11:12 +0300
Message-ID: <CAJL_dMvX-_ZpvJOUuD28RnoQpz6GFYiTvsWidfy3yeiu3Q04bA@mail.gmail.com>
References: <1318270538-30450-1-git-send-email-thomas.abraham@linaro.org>
	<1318270538-30450-2-git-send-email-thomas.abraham@linaro.org>
	<1318270538-30450-3-git-send-email-thomas.abraham@linaro.org>
	<1318270538-30450-4-git-send-email-thomas.abraham@linaro.org>
	<1318270538-30450-5-git-send-email-thomas.abraham@linaro.org>
	<1318270538-30450-6-git-send-email-thomas.abraham@linaro.org>
	<1318270538-30450-7-git-send-email-thomas.abraham@linaro.org>
	<1318270538-30450-8-git-send-email-thomas.abraham@linaro.org>
	<1318270538-30450-9-git-send-email-thomas.abraham@linaro.org>
	<1318270538-30450-10-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-gx0-f174.google.com ([209.85.161.174]:63040 "EHLO
	mail-gx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750707Ab1JLELN convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 12 Oct 2011 00:11:13 -0400
Received: by ggnv2 with SMTP id v2so284494ggn.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 11 Oct 2011 21:11:13 -0700 (PDT)
In-Reply-To: <1318270538-30450-10-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, vinod.koul@intel.com, kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org, Jassi Brar <jassisinghbrar@gmail.com>, Boojin Kim <boojin.kim@samsung.com>

On Mon, Oct 10, 2011 at 9:15 PM, Thomas Abraham
<thomas.abraham@linaro.org> wrote:
<spnip>

> +u8 pdma1_peri[] =3D {
> + =A0 =A0 =A0 DMACH_UART0_RX,
> + =A0 =A0 =A0 DMACH_UART0_TX,
> + =A0 =A0 =A0 DMACH_UART1_RX,
> + =A0 =A0 =A0 DMACH_UART1_TX,
> + =A0 =A0 =A0 DMACH_UART2_RX,
> + =A0 =A0 =A0 DMACH_UART2_TX,
> + =A0 =A0 =A0 DMACH_UART3_RX,
> + =A0 =A0 =A0 DMACH_UART3_TX,
> + =A0 =A0 =A0 DMACH_IRDA,
> + =A0 =A0 =A0 DMACH_I2S0_RX,
> + =A0 =A0 =A0 DMACH_I2S0_TX,
> + =A0 =A0 =A0 DMACH_I2S0S_TX,
> + =A0 =A0 =A0 DMACH_I2S1_RX,
> + =A0 =A0 =A0 DMACH_I2S1_TX,
> + =A0 =A0 =A0 DMACH_I2S2_RX,
> + =A0 =A0 =A0 DMACH_I2S2_TX,
> + =A0 =A0 =A0 DMACH_SPI0_RX,
> + =A0 =A0 =A0 DMACH_SPI0_TX,
> + =A0 =A0 =A0 DMACH_SPI1_RX,
> + =A0 =A0 =A0 DMACH_SPI1_TX,
> + =A0 =A0 =A0 DMACH_SPI2_RX,
> + =A0 =A0 =A0 DMACH_SPI2_TX,
> + =A0 =A0 =A0 DMACH_PCM0_RX,
> + =A0 =A0 =A0 DMACH_PCM1_TX,

typo ?  DMACH_PCM0_TX

> + =A0 =A0 =A0 DMACH_PCM1_RX,
> + =A0 =A0 =A0 DMACH_PCM1_TX,
> + =A0 =A0 =A0 DMACH_MSM_REQ0,
> + =A0 =A0 =A0 DMACH_MSM_REQ1,
> + =A0 =A0 =A0 DMACH_MSM_REQ2,
> + =A0 =A0 =A0 DMACH_MSM_REQ3,
> =A0};
