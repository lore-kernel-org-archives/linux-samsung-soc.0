From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: [PATCH v5 0/7] platform/chrome: Add user-space dev inferface
 support
Date: Mon, 16 Feb 2015 09:19:49 +0100
Message-ID: <54E1A825.7090408@collabora.co.uk>
References: <1422876388-16540-1-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:58084 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751458AbbBPITz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 16 Feb 2015 03:19:55 -0500
In-Reply-To: <1422876388-16540-1-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: Lee Jones <lee.jones@linaro.org>, Doug Anderson <dianders@chromium.org>, Bill Richardson <wfrichar@chromium.org>, Simon Glass <sjg@google.com>, Gwendal Grignou <gwendal@google.com>, Jonathan Corbet <corbet@lwn.net>, Varka Bhadram <varkabhadram@gmail.com>, Paul Bolle <pebolle@tiscali.nl>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

Hello Olof,

On 02/02/2015 12:26 PM, Javier Martinez Canillas wrote:
> Hello,
> 
> The mainline ChromeOS Embedded Controller (EC) driver is still missing some
> features that are present in the downstream ChromiumOS tree. These are:
> 
>   - Low Pin Count (LPC) interface
>   - User-space device interface
>   - Access to vboot context stored on a block device
>   - Access to vboot context stored on EC's nvram
>   - Power Delivery Device
>   - Support for multiple EC in a system
> 
> This is a fifth version of a series that adds support for the first two of
> the missing features: the EC LPC and EC character device interfaces that
> are used by user-space to access the ChromeOS EC. The support patches were
> taken from the downstream ChromiumOS 3.14 tree with the fixes and cleanups
> squashed to have a minimal patch-set.
> 

Any comments on this series? The last version was posted a couple of weeks
ago but the series have been in the list for months. Lee has already acked
the mfd changes so you can merge all through your chrome-platform tree if
you want.

It wold be great if this series get in to have the EC user-space interface
supported and to minimize the delta with the Chromemium OS kernel since it
still has other features that needs to be upstreamed like multiple EC in a
system and access to vboot context stored in block device or EC's nvram.

Best regards,
Javier
