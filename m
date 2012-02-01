From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH 5/9] ARM: EXYNOS: add board file for SMDK5250
Date: Wed, 1 Feb 2012 00:50:23 -0800
Message-ID: <CAOesGMgNdDdzsSBtopu7hu0xavFDSBnw0TW1MrN25C7FO+j8AQ@mail.gmail.com>
References: <1328024354-4277-1-git-send-email-kgene.kim@samsung.com>
	<1328024354-4277-6-git-send-email-kgene.kim@samsung.com>
	<CAH9JG2UZ9HxXsvmTh8Gqf5EpzS2sLSH_v8TWjKeBL8z7hR++Mg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f174.google.com ([209.85.212.174]:45673 "EHLO
	mail-wi0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756028Ab2BAIuY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 1 Feb 2012 03:50:24 -0500
Received: by mail-wi0-f174.google.com with SMTP id s10so697604wic.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 01 Feb 2012 00:50:23 -0800 (PST)
In-Reply-To: <CAH9JG2UZ9HxXsvmTh8Gqf5EpzS2sLSH_v8TWjKeBL8z7hR++Mg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kyungmin Park <kmpark@infradead.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, rmk+kernel@arm.linux.org.uk, arnd@arndb.de

Hi,

On Tue, Jan 31, 2012 at 8:20 PM, Kyungmin Park <kmpark@infradead.org> wrote:
> As I remember only DT based board file is acceptable for mainline?

For a new SoC family like 5250 it would be much preferred to only add
device-tree enabled boards.


-Olof
