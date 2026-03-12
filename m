Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 365A43C3432
	for <linux-samsung-soc@vger.kernel.org>; Thu, 12 Mar 2026 16:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773331700; cv=none; b=dGf7Hhz7CsyzQf9QFraQUGr8+prUfWpuyojZSSwAofVWRSnFLxkevmxil5VnZ+YFwLUuxALvYx5ZQuZ/7R80AVrWicXWpxZv8pIEDffI+CC+sM+sypAHtwUqwKUQ4JY3QXCx9d7svi/lZXD/ECHurx6rCNI3yXCxdwr3QVyIaDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773331700; c=relaxed/simple;
	bh=twDTejgFiYBq/oNh2tbzlE4khCqdmTOxTL0v/WfIyHg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=TN6ufs4LCoUZdARH9fldtv5yr+2VZBl2R6pSenATZ36TezuOEoiP3Hm7m0MTH0nsNNDnAGT9iD7dXA2IjuBvNaNtU8Ibm+7repFbx95JyWfSEtwvJp5EGPWfZdRMmt1jQokGNQo6OzB3Y9Scbdd8DVTGnHamYpD5B/wf9NUzSbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=AH0N8IMR; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="AH0N8IMR"
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20260312160810euoutp01843f6988e794aa8dcb7ef8587c82947f~cI8bx5_nR0114301143euoutp01j
	for <linux-samsung-soc@vger.kernel.org>; Thu, 12 Mar 2026 16:08:10 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20260312160810euoutp01843f6988e794aa8dcb7ef8587c82947f~cI8bx5_nR0114301143euoutp01j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1773331690;
	bh=twDTejgFiYBq/oNh2tbzlE4khCqdmTOxTL0v/WfIyHg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AH0N8IMRI4fvbzQnNTqfCJxy+BGBh2RhaXCAVdKLuajJaXzFhOgbjhknKrgIgPOyx
	 WvLSQR+NZMI03G8VBjUjW1vOhqITOp7mcxoKKyaS6HR1VsB0QNy6LWgHKknO3QiEYx
	 z0TmZJygFekR6aeoZPq/Gs5NVvLBW6vyE0GLtx6w=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20260312160809eucas1p1fc79e4d333f3995a48b68ff07ec7726c~cI8bJgs8W2038520385eucas1p1m;
	Thu, 12 Mar 2026 16:08:09 +0000 (GMT)
Received: from AMDC4515.digital.local (unknown [106.120.51.28]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260312160809eusmtip2a5fe35af5b658b73c3a82109e2b4333e~cI8aQCmCI3247232472eusmtip2_;
	Thu, 12 Mar 2026 16:08:08 +0000 (GMT)
From: Mateusz Majewski <m.majewski2@samsung.com>
To: alexey.klimov@linaro.org
Cc: alim.akhtar@samsung.com, bzolnier@gmail.com, conor+dt@kernel.org,
	daniel.lezcano@linaro.org, devicetree@vger.kernel.org, krzk@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	linux.amoon@gmail.com, lukasz.luba@arm.com, m.majewski2@samsung.com,
	m.szyprowski@samsung.com, rafael@kernel.org, robh@kernel.org,
	rui.zhang@intel.com, semen.protsenko@linaro.org
Subject: Re: [PATCH v4 0/7] Add initial Exynos850 support to the thermal
 driver
Date: Thu, 12 Mar 2026 17:07:55 +0100
Message-ID: <20260312160755.150657-1-m.majewski2@samsung.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <DGYRJ0FUBJIB.3HUS30VW280A4@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260312160809eucas1p1fc79e4d333f3995a48b68ff07ec7726c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260312160809eucas1p1fc79e4d333f3995a48b68ff07ec7726c
X-EPHeader: CA
X-CMS-RootMailID: 20260312160809eucas1p1fc79e4d333f3995a48b68ff07ec7726c
References: <DGYRJ0FUBJIB.3HUS30VW280A4@linaro.org>
	<CGME20260312160809eucas1p1fc79e4d333f3995a48b68ff07ec7726c@eucas1p1.samsung.com>

> I am looking at enabling ACPM thermal thingy but so far I see similar
> issue that temp of all sensors is reported as 10 C regardless via ACPM.
>
> Having said that I am not going to oppose this series moving forward if
> you wish.

Sure, I will probably get back to this when the other series are more
resolved like I said in the last email :) Or maybe by this time I will
learn more about ACPM but I doubt it.

Kind regards,
Mateusz Majewski
