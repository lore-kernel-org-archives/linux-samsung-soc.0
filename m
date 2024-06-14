Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D16887E76D
	for <linux-samsung-soc@vger.kernel.org>; Fri, 14 Jun 2024 18:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718389526; cv=none; b=BfU8S3BSHwqGteIdlrfl4+gJ+A6aiUTZ1snUFXp6PnjG8cCRfSoDHpPC/OyzgkFIsHNoLKVQoykTLQQ+LNIID6vWamkTCONdBeKykID75zJ09LNWYaMlxS/B8brCd4VhB28mFs13hYOO6XnwdyyY5XdqDAJRzAsJBZxjQP81tFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718389526; c=relaxed/simple;
	bh=17XqsCYTuwNMMXk8dTaMUWD29V4eaG1WBt3UP1RONPE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aFNh6pJdjnOAeNJkNVKdQaqEIEGvqh6NZc1L6cxfknHc5PqfnvT1ZFWMTONVGkIkY53Bq/Cek3HsUlRcZgHiS5VYD/RO4740UMBjeCOUGwHQZ/kgqtcrGUMU5obdJUM9hjoz0Ag3pIgTcS0x57/nmpPGitzHGBaCRT71Zc2qb7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WcIdSUhG; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WcIdSUhG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718389523;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=rVuWdzbjR5bd+U/y/e+aXYkOnbjqY8dHfGNq+VGdIi8=;
	b=WcIdSUhGvulFjHY3EGiDloMzWCfvdXxH/0qrJKBZ89yQDZU2uqgocHrSgQ4PrLSzzu2QNR
	pG3X4i+iihLH3cXEHnd0KbeqPGW9CySzWvDH5YJew9MGq6TNtEACOx/lqwXfLUyz0pIC+W
	Z42Pxug5WZL5rNEEskTDf4d4BFQ10GY=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-368-yroaDZQoPo2HAkZQVCiwnQ-1; Fri,
 14 Jun 2024 14:25:18 -0400
X-MC-Unique: yroaDZQoPo2HAkZQVCiwnQ-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 28041195608C;
	Fri, 14 Jun 2024 18:25:15 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.39.193.73])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id B377A1956087;
	Fri, 14 Jun 2024 18:25:10 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: linux-doc@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	arnd@arndb.de
Subject: [PATCH] Documentation: Remove unused "mtdset=" from kernel-parameters.txt
Date: Fri, 14 Jun 2024 20:25:08 +0200
Message-ID: <20240614182508.600113-1-thuth@redhat.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

The kernel parameter "mtdset" has been removed two years ago in
commit 61b7f8920b17 ("ARM: s3c: remove all s3c24xx support") and
thus should be removed from the documentation now, too.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 87d5bee924fe..ff02e1a02e12 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -3631,11 +3631,6 @@
 	mtdparts=	[MTD]
 			See drivers/mtd/parsers/cmdlinepart.c
 
-	mtdset=		[ARM]
-			ARM/S3C2412 JIVE boot control
-
-			See arch/arm/mach-s3c/mach-jive.c
-
 	mtouchusb.raw_coordinates=
 			[HW] Make the MicroTouch USB driver use raw coordinates
 			('y', default) or cooked coordinates ('n')
-- 
2.45.2

