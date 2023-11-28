Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="tZfn8sKT"
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFEBE1BD
	for <linux-samsung-soc@vger.kernel.org>; Mon, 27 Nov 2023 20:01:09 -0800 (PST)
Received: from epcas1p2.samsung.com (unknown [182.195.41.46])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20231128040105epoutp016a57e0ad352851a8ca1c2a9e3bb303f5~brYPIVp-W0314803148epoutp01n
	for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Nov 2023 04:01:05 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20231128040105epoutp016a57e0ad352851a8ca1c2a9e3bb303f5~brYPIVp-W0314803148epoutp01n
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1701144065;
	bh=2CQYwk/nE4R4mCEWJnb86tuvgXui34+hbqn83BIQbPM=;
	h=From:To:Cc:Subject:Date:References:From;
	b=tZfn8sKTTNdJsSSQzo2kmX577Yq4ObNABQbEON1wmssJfqHxx9Kf5tI+D1flVMQU/
	 DBmnc/nfX2ppro6705U7G6U4xza5lJ7RUrOBZMXu0s3UW5O4jTHMOrlHJagAJoJhRl
	 RFaYxTNKApRgtyAGGE1NrdDLHtaZ6n+hRnt2WFr8=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
	epcas1p1.samsung.com (KnoxPortal) with ESMTP id
	20231128040105epcas1p1f556c2b934dd3d0a87fab4c3b615f7c0~brYOy5DOr3269032690epcas1p1v;
	Tue, 28 Nov 2023 04:01:05 +0000 (GMT)
Received: from epsmgec1p1.samsung.com (unknown [182.195.36.134]) by
	epsnrtp4.localdomain (Postfix) with ESMTP id 4SfTJw3CzDz4x9Q2; Tue, 28 Nov
	2023 04:01:04 +0000 (GMT)
Received: from epcas1p4.samsung.com ( [182.195.41.48]) by
	epsmgec1p1.samsung.com (Symantec Messaging Gateway) with SMTP id
	C4.9A.09731.DF565656; Tue, 28 Nov 2023 13:01:01 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20231128040101epcas1p2d3be87354205dd7b1156cdff58ab9a96~brYLC6yCc1194511945epcas1p20;
	Tue, 28 Nov 2023 04:01:01 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20231128040101epsmtrp1185867be1011386faa25e6e9428d6cf1~brYLCTHb_0296102961epsmtrp11;
	Tue, 28 Nov 2023 04:01:01 +0000 (GMT)
X-AuditID: b6c32a36-cebfd70000002603-e6-656565fd19bd
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	A2.B7.08817.DF565656; Tue, 28 Nov 2023 13:01:01 +0900 (KST)
Received: from localhost.localdomain (unknown [10.113.221.211]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20231128040100epsmtip17de68f9fd579a11f5936edb94885c925~brYJ6fYHA3234432344epsmtip1z;
	Tue, 28 Nov 2023 04:00:59 +0000 (GMT)
From: Inki Dae <inki.dae@samsung.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-samsung-soc@vger.kernel.org, Inki Dae <inki.dae@samsung.com>
Subject: [PATCH v2] drm/exynos: fix a wrong error checking
Date: Tue, 28 Nov 2023 13:00:58 +0900
Message-Id: <20231128040058.1825205-1-inki.dae@samsung.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrEKsWRmVeSWpSXmKPExsWy7bCmge7f1NRUg9+X9S2ufH3PZjHp/gQW
	ixnn9zE5MHvc7z7O5NG3ZRWjx+dNcgHMUdk2GamJKalFCql5yfkpmXnptkrewfHO8aZmBoa6
	hpYW5koKeYm5qbZKLj4Bum6ZOUCLlBTKEnNKgUIBicXFSvp2NkX5pSWpChn5xSW2SqkFKTkF
	pgV6xYm5xaV56Xp5qSVWhgYGRqZAhQnZGe8+nWMs+MVTcf/ZOeYGxldcXYwcHBICJhL/lnt1
	MXJyCAnsYJRYeNaui5ELyP7EKLF7QRMLhPONUaLt7z9WkCqQhnWHPjNDJPYySkzrmwTlfGGU
	OPFtBjtIFZuAqsTEFffZQGwRAWWJvxNXMYLYzAJuEotPL2cBsYUFrCT2bt8OZrMA1W+7OQes
	nlfAWmLL6mfsENvkJWZe+s4OEReUODnzCQvEHHmJ5q2zwRZLCCxil1iwtoUZosFFYsvbzWwQ
	trDEq+NboAZJSbzsb2OHaJjMKHHn+goWCGcGo8Thn9cZIaqMJfYvncwEChlmAU2J9bv0IcKK
	Ejt/z4X6gE/i3dceVkjg8Up0tAlBlChJHLt4A2qKhMSFJROhbvCQeHbtKhskgGMlzp7rZ5vA
	KD8LyT+zkPwzC2HxAkbmVYxiqQXFuempxYYFRvBYTc7P3cQITmxaZjsYJ739oHeIkYmD8RCj
	BAezkgiv3sfkVCHelMTKqtSi/Pii0pzU4kOMpsAQnsgsJZqcD0yteSXxhiaWBiZmRsYmFoZm
	hkrivHMe96YICaQnlqRmp6YWpBbB9DFxcEo1MPGcmbCu9Y8bn9uOH7xN7uzG1yYd3Tf56E31
	a59VTA/lTjTS5mT/+TlHu2KbeYtx7J7H5YrnEi5oCncmOj+MerDpHwvT24vKTpMSX026UsWl
	fPm3/9yGmWkXDHQ/3Cv8V5HQ067v62Azb29ml5i5p63kNGFmjs5LbG/3XH/xNEpvL5994P3g
	DTd/Vdz1dn723/L3e5+U4pTDlqr1DBoLJvBNK9N5tOBt74OpP2v/VzS7cu6MmHx23z7xPU9t
	Q7bXlr3pfav507J6FWO48wmrtFNz4+Lkt9Wue9e43f1Nwv4JTQ91HVJvnvqed+BYo9p/i/UB
	0zZk/X4JjJJXG25vZf2sOHX3Bw2hfImj7IwsYkosxRmJhlrMRcWJAAnlAaf1AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupnluLIzCtJLcpLzFFi42LZdlhJTvdvamqqwcsFIhZXvr5ns5h0fwKL
	xYzz+5gcmD3udx9n8ujbsorR4/MmuQDmKC6blNSczLLUIn27BK6Md5/OMRb84qm4/+wccwPj
	K64uRk4OCQETiXWHPjN3MXJxCAnsZpS4tfowUxcjB1BCQmLLVg4IU1ji8OFiiJJPjBI7N1xl
	BullE1CVmLjiPhuILSKgLPF34ipGEJtZwEPi1KufYDXCAlYSe7dvZwGxWYDqt92cA1bPK2At
	sWX1M3aIG+QlZl76zg4RF5Q4OfMJC8QceYnmrbOZJzDyzUKSmoUktYCRaRWjZGpBcW56brFh
	gVFearlecWJucWleul5yfu4mRnCYaWntYNyz6oPeIUYmDsZDjBIczEoivHofk1OFeFMSK6tS
	i/Lji0pzUosPMUpzsCiJ83573ZsiJJCeWJKanZpakFoEk2Xi4JRqYDovannU+azQvR2Pjkpx
	6tlYOXR/XR+0uuxLurjaXqnWF37iy+apzT2u9+2OrUN5mPqH2T94ZnqyNaj8i+/r2vOirVJw
	VnYnz8HXB/0LIn6YfQzLOiDl6350a+tbnqCVDpzzXhT0zqqICXr/f27/S7cdMenrPMt2vvb9
	VHpZ+LroPuHbKlHlrx2TV5+52bK4uy9v+/afeRMmJQnd39v+PKMg+MrDM18d3Y9mPVbXUnL0
	8fs5tTVIkp2xK8o+d3PjuYnPd3/Puhpzam75uq2Ndzglj9a7bxT48/xhS4doaUhjoahd5LfV
	WQzsAhv+y/Qsb6t/3KB9uMdFQ93/EePNDdc7uTIOrfuwI3euuIXXOSWW4oxEQy3mouJEAGu8
	fv6iAgAA
X-CMS-MailID: 20231128040101epcas1p2d3be87354205dd7b1156cdff58ab9a96
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20231128040101epcas1p2d3be87354205dd7b1156cdff58ab9a96
References: <CGME20231128040101epcas1p2d3be87354205dd7b1156cdff58ab9a96@epcas1p2.samsung.com>

Fix a wrong error checking in exynos_drm_dma.c module.

In the exynos_drm_register_dma function, both arm_iommu_create_mapping()
and iommu_get_domain_for_dev() functions are expected to return NULL as
an error.

However, the error checking is performed using the statement
if(IS_ERR(mapping)), which doesn't provide a suitable error value.
So check if 'mapping' is NULL, and if it is, return -ENODEV.

This issue[1] was reported by Dan.

Changelog v1:
- fix build warning.

[1] https://lore.kernel.org/all/33e52277-1349-472b-a55b-ab5c3462bfcf@moroto.mountain/

Reported-by : Dan Carpenter <dan.carpenter@linaro.org>
Signed-off-by: Inki Dae <inki.dae@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_dma.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dma.c b/drivers/gpu/drm/exynos/exynos_drm_dma.c
index a971590b8132..e2c7373f20c6 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dma.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dma.c
@@ -107,18 +107,16 @@ int exynos_drm_register_dma(struct drm_device *drm, struct device *dev,
 		return 0;
 
 	if (!priv->mapping) {
-		void *mapping;
+		void *mapping = NULL;
 
 		if (IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU))
 			mapping = arm_iommu_create_mapping(&platform_bus_type,
 				EXYNOS_DEV_ADDR_START, EXYNOS_DEV_ADDR_SIZE);
 		else if (IS_ENABLED(CONFIG_IOMMU_DMA))
 			mapping = iommu_get_domain_for_dev(priv->dma_dev);
-		else
-			mapping = ERR_PTR(-ENODEV);
 
-		if (IS_ERR(mapping))
-			return PTR_ERR(mapping);
+		if (!mapping)
+			return -ENODEV;
 		priv->mapping = mapping;
 	}
 
-- 
2.25.1

