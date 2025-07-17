Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF3F51A83FB
	for <linux-samsung-soc@vger.kernel.org>; Thu, 17 Jul 2025 03:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752723156; cv=none; b=NpFKGbeD/ATst0tkpZ5fjgZ3fy4OLnjvRrGU7LBkWwzfAdq8M3JxJ+jxk/9ZA4lthPQ0KzxWw8QrBeqWXwoNpjzTSS/wC4ih/zpNQwkSKJCyNVOXyoCuLDEM7rqY1oAe9JW0lZbEzw8DTWecNGjgllv34ko2C5T3MZVwLEWzKcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752723156; c=relaxed/simple;
	bh=u0HoJ5h72t0o8MWHTDCV8a9gVUilTrQ2p+/B69p45b0=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=UIT/NSIyTcvoBLJS/e0O5s0xGPb2q1+2XEov8H/neS6ENSOO4qkj4rZlDpsu4hOcU3wQ0nbE/L0/Qwk+szM5uNYNsrJldsw5tQPIDx+lbhjDhJz0kmI1bTorI2WCDGRnlVCNMFjVZEOsNCFDspUwe8mhU0icwrQYMwewsuQe1h8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=Sd120Sj+; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="Sd120Sj+"
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250717033231epoutp04addd7afb30a50b80a17d041e2474e29c~S7GuX2xfo1327313273epoutp04Y
	for <linux-samsung-soc@vger.kernel.org>; Thu, 17 Jul 2025 03:32:31 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250717033231epoutp04addd7afb30a50b80a17d041e2474e29c~S7GuX2xfo1327313273epoutp04Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1752723151;
	bh=wtgAOa4GSUziwCJMssifdopqTXEYBR+/Wnr2hYJlNsE=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=Sd120Sj+9mJ5AEfd0hWAR+iJG/xwqmDSpPHOBKqqtSilpIwuL+i9vI7cBeVcGk5rV
	 VHwftBpIqtmSQtrHuV4AqttCi014zdVdw2zQkNA6wcQ/Nebdf0JFkFmjEgWPHitQX+
	 0wKawRiAmvS/R9Z2tCXmWDoBzHFV0QzquNMGMamw=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250717033231epcas5p2a3c51123fe882ea8c53d5d9f7fc62cdb~S7GtsS0PK2221822218epcas5p2Z;
	Thu, 17 Jul 2025 03:32:31 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.93]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4bjJQQ2y70z6B9mF; Thu, 17 Jul
	2025 03:32:30 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250717033229epcas5p1464870a12adb7d5bc1f8f167a3915592~S7Gr936NM1620016200epcas5p1S;
	Thu, 17 Jul 2025 03:32:29 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250717033227epsmtip25b85527e412e4455b6917d0c14a48faf~S7GqrEfkj0106101061epsmtip2W;
	Thu, 17 Jul 2025 03:32:27 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Sowon Na'" <sowon.na@samsung.com>, <robh@kernel.org>,
	<krzk@kernel.org>, <conor+dt@kernel.org>, <vkoul@kernel.org>,
	<kishon@kernel.org>
Cc: <krzk+dt@kernel.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-samsung-soc@vger.kernel.org>
In-Reply-To: <20250702013316.2837427-2-sowon.na@samsung.com>
Subject: RE: [PATCH 1/5] phy: samsung-ufs: update calibration settings for
 EVT2
Date: Thu, 17 Jul 2025 09:02:26 +0530
Message-ID: <1e9001dbf6cb$6c210960$44631c20$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-us
Thread-Index: AQKcRDJWwAug8EBOlN5S0ESXxoAVsAJii8AiAqsl+u+yjJ7w0A==
X-CMS-MailID: 20250717033229epcas5p1464870a12adb7d5bc1f8f167a3915592
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250702013332epcas2p159e663ba3bde9f5bf28ccd743c211fd8
References: <20250702013316.2837427-1-sowon.na@samsung.com>
	<CGME20250702013332epcas2p159e663ba3bde9f5bf28ccd743c211fd8@epcas2p1.samsung.com>
	<20250702013316.2837427-2-sowon.na@samsung.com>

Hi Sowon,=20

> -----Original Message-----
> From: Sowon Na <sowon.na=40samsung.com>
> Sent: Wednesday, July 2, 2025 7:03 AM
> To: robh=40kernel.org; krzk=40kernel.org; conor+dt=40kernel.org;
> vkoul=40kernel.org; alim.akhtar=40samsung.com; kishon=40kernel.org
> Cc: krzk+dt=40kernel.org; linux-kernel=40vger.kernel.org;
> devicetree=40vger.kernel.org; linux-samsung-soc=40vger.kernel.org;
> sowon.na=40samsung.com
> Subject: =5BPATCH 1/5=5D phy: samsung-ufs: update calibration settings fo=
r EVT2
>=20
> The hardware EVT version for exynosautov920 has been updated, with EVT2
> confirmed as the final production version. Accordingly, this patch update=
s the
> UFS PHY calibration settings to match EVT2 hardware characteristics.
>=20
This patch does more then what is mentioned here,=20
please update the commit with all the changes so that we understand why the=
 changes was done.=20
=2E
=2E
.=5Bsnip=5D
> -=23define EXYNOSAUTOV920_CDR_LOCK_OFFSET
> 	0xce4
> -
> +=23define EXYNOSAUTOV920_CAL_DONE_OFFSET
> 	0xce0
Any reason for not using CRD lock and using Cal Done?=20


