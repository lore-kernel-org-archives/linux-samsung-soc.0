Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F6992110;
	Mon, 31 Mar 2025 09:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743413818; cv=none; b=LkWtO2hTvcIGSn2751KoDHxPSs2gHYVf38UW2ba+p1cQwbQkwNXNkq0ZfBLEQ24TpeZNfUSJYanoKB6zG1rcdKK06Q9kM63tUPMSeV7thNGPgoqmE5+Gt7R9GvmH6omHZHHSq+UkZJtxvmYo1o8DItIutelCTAOAsW4kKz/Pqoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743413818; c=relaxed/simple;
	bh=dWMf0zWm9DMcuVxBQ2kWb+B/eofdaEh5V43hOzHRsX4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OVZORzD8rp4wJyv3PZHuPu7wjOKyNQWaQglIWl0TFXxkBrrem8FQYq++8Dwkm1QXuZAdVr6YUzL5Dx/SnytYBhDYjicSiM89fdWghhfBtmOF2hRqVBK3/e8fNBJtlIHOrdmTaHnj46RfSL5j6OEX4oI0f4JYEzMLygi6uNc6ZWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BSgq/Gsf; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BSgq/Gsf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743413817; x=1774949817;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=dWMf0zWm9DMcuVxBQ2kWb+B/eofdaEh5V43hOzHRsX4=;
  b=BSgq/Gsf4erxAEl6QsmK56tlUQlCsLcyk6bIfh2TRvl3SwYau271N79U
   3+/guPSGiLEBYSV0H7BnREXVKaJuIzjPlRQFHtx0U2wlOA0HyuZFsL9wn
   6feDANxJKExgsjQ25swj/WA9HXXKTEuE7xaGdHGE1qVVWlI4p+QMm5niy
   4L6azDgCg45s1daSVq3bhmQ1uP1d1CkdwOBV9O+4Rm3kEfROG1BMRIR+b
   AoKVjG9yb32JVjVi7fqgoJY9DIuufNp02yPynDYD7yJqzo/qdStBUDU8u
   ka6DPbz/LMHk+Z0mPHXD8vUpeB92Y3yRTgSnfCBlrlbwzTmdNgbSTW//9
   g==;
X-CSE-ConnectionGUID: uKMq8hwSTdKi3LnNN0OSLg==
X-CSE-MsgGUID: SyEWMNz/QL6fLnIqykn8Mg==
X-IronPort-AV: E=McAfee;i="6700,10204,11389"; a="44581829"
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; 
   d="scan'208";a="44581829"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2025 02:36:56 -0700
X-CSE-ConnectionGUID: hstVzWFBRcO4ohhrEvb02A==
X-CSE-MsgGUID: Ddp38qlwR5uOkKn7Dt6a4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; 
   d="scan'208";a="125856501"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa006.fm.intel.com with ESMTP; 31 Mar 2025 02:36:54 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 817FF1CE; Mon, 31 Mar 2025 12:36:53 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Russell King <linux@armlinux.org.uk>
Subject: [PATCH v1 1/1] ARM: s3c: stop including gpio.h
Date: Mon, 31 Mar 2025 12:36:50 +0300
Message-ID: <20250331093650.4028999-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver does not use legacy GPIO API, stop including this header.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 arch/arm/mach-s3c/gpio-samsung.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-s3c/gpio-samsung.c b/arch/arm/mach-s3c/gpio-samsung.c
index 87daaa09e2c3..79fdb52c4a6b 100644
--- a/arch/arm/mach-s3c/gpio-samsung.c
+++ b/arch/arm/mach-s3c/gpio-samsung.c
@@ -11,9 +11,9 @@
 // Samsung - GPIOlib support
 
 #include <linux/kernel.h>
+#include <linux/gpio/driver.h>
 #include <linux/irq.h>
 #include <linux/io.h>
-#include <linux/gpio.h>
 #include <linux/init.h>
 #include <linux/spinlock.h>
 #include <linux/module.h>
-- 
2.47.2

