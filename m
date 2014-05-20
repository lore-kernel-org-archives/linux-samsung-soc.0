From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH 0/3] Support for multiple MFC FW sub-versions
Date: Tue, 20 May 2014 20:03:17 +0200
Message-ID: <537B98E5.6000505@gmail.com>
References: <1400581029-3475-1-git-send-email-arun.kk@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f45.google.com ([74.125.83.45]:52403 "EHLO
	mail-ee0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751741AbaETSD0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 20 May 2014 14:03:26 -0400
In-Reply-To: <1400581029-3475-1-git-send-email-arun.kk@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arun Kumar K <arun.kk@samsung.com>, linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: k.debski@samsung.com, s.nawrocki@samsung.com, posciak@chromium.org, avnd.kiran@samsung.com, arunkk.samsung@gmail.com

Hi Arun,

On 20.05.2014 12:17, Arun Kumar K wrote:
> This patchset is for supporting multple firmware sub-versions
> for MFC. Newer firmwares come with changed interfaces and fixes
> without any change in the fw version number.
> So this implementation is as per Tomasz Figa's suggestion [1].
> [1] http://permalink.gmane.org/gmane.linux.kernel.samsung-soc/31735
> 
> Arun Kumar K (3):
>   [media] s5p-mfc: Remove duplicate function s5p_mfc_reload_firmware
>   [media] s5p-mfc: Support multiple firmware sub-versions
>   [media] s5p-mfc: Add init buffer cmd to MFCV6
> 
>  drivers/media/platform/s5p-mfc/s5p_mfc.c        |   11 +++---
>  drivers/media/platform/s5p-mfc/s5p_mfc_common.h |   11 +++++-
>  drivers/media/platform/s5p-mfc/s5p_mfc_ctrl.c   |   44 ++++++-----------------
>  drivers/media/platform/s5p-mfc/s5p_mfc_opr_v6.c |    6 ++--
>  4 files changed, 30 insertions(+), 42 deletions(-)
> 

The whole series looks good.

Reviewed-by: Tomasz Figa <t.figa@samsung.com>

Best regards,
Tomasz
