Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92F27364931;
	Fri, 20 Mar 2026 21:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774043957; cv=none; b=Svh1sZQ/CrhFdqRqQcunVupbu75uOcHVGYPSbIhumpIcXA6KONEBLFAcKlzSVHwuddKLtKZ5VLEsH6smhXwDxap2YbGnzWp/bYqPulMTrmfr70v+z2NateVvk4FQWAYtHTbgXOqG/UGKfr9Z3ElF6uAlm1VHJYKfnWLXHW2cVR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774043957; c=relaxed/simple;
	bh=vd4BRnnq2rEJHHWbkq8BGz3T9GQAcamOq0h8L4YbKXo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Wrig7hguG1DI91n4/uUJRGtn11IHLZIPJNMrCzHW79abl49aGpexIV7HZePEa78eCE21lYSzIvRakBlUy0i8HV/jSVlKpMv41F7kSsjWTJ/qHHPcXztZmhfJvXMOyXoUF5DjHwqt+Dk84avBh/qQy2EaTHkpZXA+3IOcvyB1RQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bj/J9ty4; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bj/J9ty4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774043955; x=1805579955;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=vd4BRnnq2rEJHHWbkq8BGz3T9GQAcamOq0h8L4YbKXo=;
  b=Bj/J9ty404VGM6FlvemPxBBmG9YnA7+itUybe6Hzq+bQPLy+WIFfPvT+
   mUmdDSnBYjXd0GmWjbVUQQqMjC9OkIF0ZD8zFdDsDhM9Vp3JL8KCnRBJb
   +/AlGj6tKebA5UDXJtB02xDlxk0ayZ79lGNa5ydEKPzxAHuHMbb2qxuen
   EFydjnNl7s3WXRVFoONm8qXLFe9UByBTBBQBLp5tCsa7Lh55wCol5b0Tk
   jodYPhNr0PyAt3k7VOc4Cw8cygfXeavs/Gs5vrxmBBKI7Eb6kUr3ND9IK
   rd1WW/68Gxa1dptwj1vFC68NW8GKBOwQJkGisMSEood60VIzSrOav2JX0
   Q==;
X-CSE-ConnectionGUID: JvBS22GIRS+sH1BxNl/tfA==
X-CSE-MsgGUID: kYDO59apSpeQBhceAcqpcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11735"; a="77745005"
X-IronPort-AV: E=Sophos;i="6.23,132,1770624000"; 
   d="scan'208";a="77745005"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2026 14:59:15 -0700
X-CSE-ConnectionGUID: bpKcTdnUQhmyo1m4HlIQEg==
X-CSE-MsgGUID: xryDAYDgSLq5IZnW3gPtYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,132,1770624000"; 
   d="scan'208";a="228140223"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa005.fm.intel.com with ESMTP; 20 Mar 2026 14:59:13 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 373F895; Fri, 20 Mar 2026 22:59:12 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-media@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH v1 1/1] media: camif-core: Drop unused include
Date: Fri, 20 Mar 2026 22:59:10 +0100
Message-ID: <20260320215910.3236783-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This driver includes the legacy header <linux/gpio.h> but does
not use any symbols from it. Drop the inclusion.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/media/platform/samsung/s3c-camif/camif-core.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/platform/samsung/s3c-camif/camif-core.c b/drivers/media/platform/samsung/s3c-camif/camif-core.c
index 221e3c447f36..94e9999bb8e5 100644
--- a/drivers/media/platform/samsung/s3c-camif/camif-core.c
+++ b/drivers/media/platform/samsung/s3c-camif/camif-core.c
@@ -12,7 +12,6 @@
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/errno.h>
-#include <linux/gpio.h>
 #include <linux/i2c.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
-- 
2.50.1

