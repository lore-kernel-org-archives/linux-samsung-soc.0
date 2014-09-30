From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH 1/2] tty: serial: samsung: Clean-up selection of number
 of available UARTs
Date: Tue, 30 Sep 2014 22:34:20 +0200
Message-ID: <542B13CC.8000809@gmail.com>
References: <1412087695-10591-1-git-send-email-a.kesavan@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f173.google.com ([209.85.212.173]:55647 "EHLO
	mail-wi0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751619AbaI3UeY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 30 Sep 2014 16:34:24 -0400
Received: by mail-wi0-f173.google.com with SMTP id bs8so5448368wib.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Sep 2014 13:34:23 -0700 (PDT)
In-Reply-To: <1412087695-10591-1-git-send-email-a.kesavan@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Abhilash Kesavan <a.kesavan@samsung.com>, linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, jslaby@suse.cz, gregkh@linuxfoundation.org

Abhilash,

On 30.09.2014 16:34, Abhilash Kesavan wrote:
> Remove symbols SERIAL_SAMSUNG_UARTS_4 and SERIAL_SAMSUNG_UARTS which
> select the number of UART ports available on the SoC. Use the maximum
> number of UART ports possible across the serial driver in place of
> SERIAL_SAMSUNG_UARTS. Removal of these symbols also helps in Exynos7
> serial enablement.
> 

AFAICT this patch should be second in the series, because it removes
symbols which are used by code that is yet to be updated in current patch 2.

Otherwise:

Reviewed-by: Tomasz Figa <tomasz.figa@gmail.com>

Best regards,
Tomasz
