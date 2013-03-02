From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 1/4] ARM: s3c24xx: Removed unneeded dependency on ARCH_S3C24XX for boards
Date: Sat, 2 Mar 2013 11:43:38 +0000
Message-ID: <201303021143.38390.arnd@arndb.de>
References: <1362216174-10478-1-git-send-email-shc_work@mail.ru>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.17.8]:49564 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751697Ab3CBLn6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 2 Mar 2013 06:43:58 -0500
In-Reply-To: <1362216174-10478-1-git-send-email-shc_work@mail.ru>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Alexander Shiyan <shc_work@mail.ru>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>

On Saturday 02 March 2013, Alexander Shiyan wrote:
> Board options are already under "if ARCH_S3C24XX" condition, so
> additional dependencies on this symbol can be removed.
> 
> Signed-off-by: Alexander Shiyan <shc_work@mail.ru>

Hi Alexander,

Is this just a cosmetic change that has no other consequences, or do you
have other follow-up patches that depend on patches 1-3?

	Arnd
