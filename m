From: Joonyoung Shim <jy0922.shim@samsung.com>
Subject: Re: [PATCH v4 3/3] input: samsung-keypad - Add samsung keypad driver
Date: Wed, 16 Jun 2010 17:17:32 +0900
Message-ID: <4C18889C.2030501@samsung.com>
References: <1276243728-17704-1-git-send-email-jy0922.shim@samsung.com>
 <1276243728-17704-3-git-send-email-jy0922.shim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:20676 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750951Ab0FPIRd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 16 Jun 2010 04:17:33 -0400
In-reply-to: <1276243728-17704-3-git-send-email-jy0922.shim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-input@vger.kernel.org
Cc: ben-linux@fluff.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kyungmin.park@samsung.com, dmitry.torokhov@gmail.com, kgene.kim@samsung.com

On 6/11/2010 5:08 PM, Joonyoung Shim wrote:
> This patch adds support for keypad driver running on Samsung cpus. This
> driver is tested on GONI and Aquila board using S5PC110 cpu.
> 
> Signed-off-by: Joonyoung Shim <jy0922.shim@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  drivers/input/keyboard/Kconfig          |    9 +
>  drivers/input/keyboard/Makefile         |    1 +
>  drivers/input/keyboard/samsung-keypad.c |  400 +++++++++++++++++++++++++++++++
>  3 files changed, 410 insertions(+), 0 deletions(-)
>  create mode 100644 drivers/input/keyboard/samsung-keypad.c
> 

Hi,

Dmitry and Kukjin, any feedback on this?
