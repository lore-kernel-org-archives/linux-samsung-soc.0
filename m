From: Andrzej Pietrasiewicz <andrzej.p@samsung.com>
Subject: [PATCH 0/2] More s5p-jpeg fixes
Date: Fri, 11 Aug 2017 13:49:59 +0200
Message-ID: <1502452201-17171-1-git-send-email-andrzej.p@samsung.com>
References: <1502191352-11595-1-git-send-email-andrzej.p@samsung.com>
        <CGME20170811115011eucas1p2d31daaa9e6f8d142291d9352ad5b732c@eucas1p2.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:33126 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752526AbdHKLuP (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 11 Aug 2017 07:50:15 -0400
In-reply-to: <1502191352-11595-1-git-send-email-andrzej.p@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Andrzej Pietrasiewicz <andrzej.p@samsung.com>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Mauro Carvalho Chehab <mchehab@osg.samsung.com>, Thierry Escande <thierry.escande@collabora.com>, Krzysztof Kozlowski <krzk@kernel.org>

Hi All,

The first patch in the series fixes decoding path,
the second patch fixes encoding path. Please see
appropriate commit messages.

Andrzej Pietrasiewicz (2):
  media: s5p-jpeg: don't overwrite result's "size" member
  media: s5p-jpeg: set w/h when encoding

 drivers/media/platform/s5p-jpeg/jpeg-core.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

-- 
1.9.1
