From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL 5/7] Samsung pinctrl-2 for v3.8
Date: Wed, 28 Nov 2012 09:16:03 +0900
Message-ID: <50B557C3.4040502@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:60067 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752428Ab2K1AQI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 27 Nov 2012 19:16:08 -0500
Received: by mail-pb0-f46.google.com with SMTP id wy7so9281234pbc.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 27 Nov 2012 16:16:08 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

Arnd, Olof,

This is updating Samsung pinctrl for v3.8 and actually just including 
fix a checkpatch error.

This is based on next/pinctrl-samsung is already into arm-soc tree.

Please pull from:
git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git 
next/pinctrl-samsung-2

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

The following changes since commit 4a991b410cd7940c48f261e854e8698923e23fd2:

   pinctrl: samsung: Update error check for unsigned variables 
(2012-11-19 10:03:35 +0900)

are available in the git repository at:
   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git 
next/pinctrl-samsung-2

Sachin Kamat (1):
       pinctrl: samsung: Do not initialise statics to 0

  drivers/pinctrl/pinctrl-samsung.c |    2 +-
  1 files changed, 1 insertions(+), 1 deletions(-)
