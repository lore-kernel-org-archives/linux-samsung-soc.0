Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A44E9169AE6
	for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Jul 2024 05:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722318589; cv=none; b=qgfhMIeq3lzBQqRuhwX4M640cJRKO0cDU3ZLZgOFbgMkvi/B9T+L8UINNzUdQu8LrRhkwtOM+iOxlws4iQjI4EChpNlPUKv9feVtGtxT5tC1FVFdmHcOuNcjk+1jMngfCq18YUn6/kYYSi0c6SFBANNeU8ZqyZdZYCqmeR9uaoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722318589; c=relaxed/simple;
	bh=YIKIAyWdRJabHnvT6F2z6sdR9iUV5RNtOySV5Cp8rwI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:In-Reply-To:
	 Content-Type:References; b=TCZv/xM1+/DnnWZp0lScwIgIZrID8oe0xYQ0kggbIRDpb/cJt98aciZVbebh638rHw0zvVv6d+PWcRv/hRmUprvjz8/mZ8pKO/doW53dhhuWgXnpBSsDnTyNMMrCRmzeTfaTUqRRCV/pL19yDSXZly0KgflT3WEom1EwsqvpL8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=TFDheW/j; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="TFDheW/j"
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20240730054937epoutp023b888592b45d7cce1bc65197911969a7~m558Q-_0S1104011040epoutp029
	for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Jul 2024 05:49:37 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20240730054937epoutp023b888592b45d7cce1bc65197911969a7~m558Q-_0S1104011040epoutp029
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1722318577;
	bh=X61DCeVAKjkbWX+SIU4s/W8PLXps4OElapjhV+O3WpA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=TFDheW/jjIT/rmdZTlKs96FesDilhL1NukpjlCPCLlxdG2l2XOrmmkSKeKFgx7+mP
	 j8O62GRkQdTRgCvXvv29uCvfk0kFtanZsmzK2hCeo+gXgG/nziQy4htp/vM8kHudY3
	 oVFFnkkrd/6/Goq3iAVOtvk1Y0ztbkpvbGLg86MQ=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
	epcas1p1.samsung.com (KnoxPortal) with ESMTP id
	20240730054937epcas1p12f514eec09632df48784b190c60d0d9a~m557qMGGX1342813428epcas1p1G;
	Tue, 30 Jul 2024 05:49:37 +0000 (GMT)
Received: from epsmges1p4.samsung.com (unknown [182.195.38.233]) by
	epsnrtp3.localdomain (Postfix) with ESMTP id 4WY4736TYpz4x9Px; Tue, 30 Jul
	2024 05:49:35 +0000 (GMT)
Received: from epcas1p1.samsung.com ( [182.195.41.45]) by
	epsmges1p4.samsung.com (Symantec Messaging Gateway) with SMTP id
	47.07.10258.FEE78A66; Tue, 30 Jul 2024 14:49:35 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20240730054935epcas1p2c7ba1a09ce98d8ae32df973572331e9d~m5550Gfwq3254232542epcas1p2F;
	Tue, 30 Jul 2024 05:49:35 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20240730054935epsmtrp18c31a7d9129be679c5de3729b49b8d5a~m555zFr-z2708427084epsmtrp1C;
	Tue, 30 Jul 2024 05:49:35 +0000 (GMT)
X-AuditID: b6c32a38-995ff70000002812-f9-66a87eef51f1
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	CD.FE.08964.FEE78A66; Tue, 30 Jul 2024 14:49:35 +0900 (KST)
Received: from mediavision (unknown [10.113.111.204]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20240730054934epsmtip14ec151f9048ae17235316d58b40ae5d3~m555i-2W50226702267epsmtip18;
	Tue, 30 Jul 2024 05:49:34 +0000 (GMT)
Date: Tue, 30 Jul 2024 14:49:34 +0900
From: Kwanghoon Son <k.son@samsung.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: s.nawrocki@samsung.com, cw00.choi@samsung.com, alim.akhtar@samsung.com,
	mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	conor+dt@kernel.org, tomasz.figa@gmail.com,
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/4] dt-bindings: clk: exynosautov9: add dpum clock
 definitions
Message-ID: <Zqh-7jHUoFPVS_Cp@mediavision>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <32d3c894-64ba-40ac-aef4-988c3f90c2a1@kernel.org>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrAJsWRmVeSWpSXmKPExsWy7bCmru77uhVpBodn61s8mLeNzWLN3nNM
	Fte/PGe1mH/kHKvF+fMb2C02Pb7GavGx5x6rxYzz+5gsLp5ytfi/Zwe7xeE37awW/65tZLFY
	tesPowOvx/sbreweO2fdZffYtKqTzWPzknqPvi2rGD0+b5ILYIvKtslITUxJLVJIzUvOT8nM
	S7dV8g6Od443NTMw1DW0tDBXUshLzE21VXLxCdB1y8wBulNJoSwxpxQoFJBYXKykb2dTlF9a
	kqqQkV9cYquUWpCSU2BaoFecmFtcmpeul5daYmVoYGBkClSYkJ1x8dksloIPbBXTj8Y2MD5g
	7WLk5JAQMJE4vOIUSxcjF4eQwA5Gib/n/rNDOJ8YJTaeuMkMUiUk8I1R4t/dRJiOrd+eskEU
	7WWUWLb+DROE84pR4nrfW7AOFgFViS1zVjOB2GwC6hJL2tayg9giApoS1/9+ZwVpYBbYxSQx
	ceJssCJhgVCJyzc7wGxeAS2JRwemM0LYghInZz5hAbE5BewklvRMZARplhBYyiGx4U4PO8RN
	LhLfHu9hhrCFJV4d3wIVl5J42d8GZWdLHP24lw3CLpG4PmsRNASMJfYvnQy2mFkgU+JJyz9G
	CJtP4t3XHqAaDqAaXomONiEIU17iVmc5RKeoxJmnH6Emekj0XlkLDYi3jBKbJ3xmn8AoOwvJ
	C7OQbICwdSQW7P7ENgtoLLOAtMTyfxwQpqbE+l36CxhZVzGKpRYU56anFhsWmMAjNTk/dxMj
	OKlqWexgnPv2g94hRiYOxkOMEhzMSiK88VeWpgnxpiRWVqUW5ccXleakFh9iNAVGyERmKdHk
	fGBazyuJNzSxNDAxMzI2sTA0M1QS5z1zpSxVSCA9sSQ1OzW1ILUIpo+Jg1OqgSnkHrNB/a61
	DBU2PZzPhE9f6+tP1guzaj9Su7CmVP1zKc/MuzP2Ri4zcyr9k8Ej2rGs+ZtgoZQ8t8g7lhdc
	h0+unfe1PG3ql9RXTrrTNx7eOOuE1ZJTTX0fbLctlnbpcWzeyrCRPWHWwpftGZcd9e+fkE2d
	tX5/7jpljmoO/iMyfkZugau/NBscmxHgc1lnwr/jL3Ij+OfH+U8oPTLv0n42j+U/1MVknhsv
	Ul/7pSqxbXKjJNPRAIMi5UO3n6wTX5/et2sLBwPvDIe/j99uyDhgG3AoZdN/Ue+/ub91XvJa
	vbB78DUxKFTD9udty5nCvCe07y4zmrpcQdx4+0dm5Q/HNlp7PQ6c3vpLdzan134lluKMREMt
	5qLiRADxSN8aMwQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrMLMWRmVeSWpSXmKPExsWy7bCSnO77uhVpBrc/cVg8mLeNzWLN3nNM
	Fte/PGe1mH/kHKvF+fMb2C02Pb7GavGx5x6rxYzz+5gsLp5ytfi/Zwe7xeE37awW/65tZLFY
	tesPowOvx/sbreweO2fdZffYtKqTzWPzknqPvi2rGD0+b5ILYIvisklJzcksSy3St0vgymh6
	vJ+1YC1LRffxt+wNjNuYuxg5OSQETCS2fnvK1sXIxSEksJtR4vviZiaIhKhEx+VGxi5GDiBb
	WOLw4WKImheMEruW/WcBqWERUJXYMmc1WD2bgLrEkra17CC2iICmxPW/31lBGpgFdjFJTJw4
	G6xIWCBU4vLNDjCbV0BL4tGB6YwQU98ySrS9n8UMkRCUODnzCdgGZqCiG/9eMoFcwSwgLbH8
	HwdImFPATmJJz0TGCYwCs5B0zELSMQuhYwEj8ypGydSC4tz03GLDAsO81HK94sTc4tK8dL3k
	/NxNjOB40dLcwbh91Qe9Q4xMHIyHGCU4mJVEeOOvLE0T4k1JrKxKLcqPLyrNSS0+xCjNwaIk
	ziv+ojdFSCA9sSQ1OzW1ILUIJsvEwSnVwLTY48hj1jNcLQnbyredO6qx8+CpkJ/zZ5QKbdsp
	tDvOge9Dt2mm6ZxZ0gu5OOU3782xq5ldHbKiwTJU//Ihk6WcU/pzvrvu1fiy/9qbhVbnu9Ze
	bL1/ne9Act5am69nY64Uv5I4LhPs4tWrUnogQkQ/+fKR74p/bHYvi1M/OHlF7aa19s3R7+ff
	1jZYKf38QGbievOtHM8u8IS12Lp+5F65T7U3/nlr3ye/lRx9hj8d60Ue5pzRCRViUEh4Puva
	at+zNs31kwsfAwNl/y7GncXHJn2UuiZp8/rUDaN5C9Q9PWY+yOVN/lBdmmXrVpUqMfOblvf+
	429zc3kWLbK7so9L6l/mBndnxwvL2b/PUFNiKc5INNRiLipOBAAvFDIkBgMAAA==
X-CMS-MailID: 20240730054935epcas1p2c7ba1a09ce98d8ae32df973572331e9d
X-Msg-Generator: CA
Content-Type: multipart/mixed;
	boundary="----FA1Tv02vcQgKPUvMWmRcKT-.sDXi7p4P_8Ht8JYkzd1l4y70=_1508f0_"
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240729043102epcas1p3f5f6421b6899673256c7548db3333d6e
References: <20240729043039.134435-1-k.son@samsung.com>
	<CGME20240729043102epcas1p3f5f6421b6899673256c7548db3333d6e@epcas1p3.samsung.com>
	<20240729043039.134435-2-k.son@samsung.com>
	<32d3c894-64ba-40ac-aef4-988c3f90c2a1@kernel.org>

------FA1Tv02vcQgKPUvMWmRcKT-.sDXi7p4P_8Ht8JYkzd1l4y70=_1508f0_
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Jul 29, 2024 at 08:03:49AM +0200, Krzysztof Kozlowski wrote:
> On 29/07/2024 06:30, Kwanghoon Son wrote:
> > Add dpum clk definitions.
> > 
> > Signed-off-by: Kwanghoon Son <k.son@samsung.com>
> > ---
> >  include/dt-bindings/clock/samsung,exynosautov9.h | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> > 
> 
> Why using different subject prefixes for binding patches?
> 
> Anyway, headers go with the schema/bindings file.

Thanks for feedback. I'll squash patch 1,2 in v2.

Kwang.

> 
> Best regards,
> Krzysztof
> 

------FA1Tv02vcQgKPUvMWmRcKT-.sDXi7p4P_8Ht8JYkzd1l4y70=_1508f0_
Content-Type: text/plain; charset="utf-8"


------FA1Tv02vcQgKPUvMWmRcKT-.sDXi7p4P_8Ht8JYkzd1l4y70=_1508f0_--
