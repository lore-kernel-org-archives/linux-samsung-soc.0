From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: [PATCH 0/2] rtc: Fix module autoload for max77xx RTC drivers
Date: Wed, 13 May 2015 17:18:00 +0200
Message-ID: <1431530282-10672-1-git-send-email-javier.martinez@collabora.co.uk>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:45792 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934437AbbEMPS2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 13 May 2015 11:18:28 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: Alessandro Zummo <a.zummo@towertech.it>, Olof Johansson <olof@lixom.net>, Doug Anderson <dianders@chromium.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, rtc-linux@googlegroups.com, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Javier Martinez Canillas <javier.martinez@collabora.co.uk>

Hello Alexandre and Alessandro,

This is a trivial series that fixes module autoloading for the Maxim
MAX77686 and MAX77802 RTC drivers that didn't export their platform
device ID table with MODULE_DEVICE_TABLE() so modalias information
was not available.

The series is composed of the following patches:

Javier Martinez Canillas (2):
  rtc: max77686: Report platform modalias to fix module autoload
  rtc: max77802: Report platform modalias to fix module autoload

 drivers/rtc/rtc-max77686.c | 1 +
 drivers/rtc/rtc-max77802.c | 1 +
 2 files changed, 2 insertions(+)

Best regards,
Javier
