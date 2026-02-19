Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD6F033EAE4
	for <linux-samsung-soc@vger.kernel.org>; Thu, 19 Feb 2026 11:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771500449; cv=none; b=D8QodfuTtzo2fturYiFf2Wy0njvnzxAv0kVHJ7tPbGrB7o+ett1uu8XFIjpDBq+ReJNZX9ppldWKzXmq1/RH78G8i44AIp745Qt8RBucVxmyLGMsbQ5ZyiOhVn3lxU/HANCbq8XI1UAs85SdQxQWm/8qi/cxE72QoENGz1589jU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771500449; c=relaxed/simple;
	bh=QDmpj9Mhi+yaAgNVbdMPNkUREhCivGToVpPYIMUn09A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p6Z9UHDJZ805p0pPiIB6YpeO6Hq7QdRqQdZ3MApvfIcEbTn/v6zCSPSy3gypofkuVsg4I+qWezJWo3h6ZNCHukbXkAl3GZtziaaFBwjR0AkO8KGVdOeWXJsIuIrS6sEyma52SW0bJwrqNTd2/7ScEanjq5JEik8Zs1wSnODiF7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L2TYlkTP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H+u/IklS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L2TYlkTP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H+u/IklS"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61JA0iSI1625018
	for <linux-samsung-soc@vger.kernel.org>; Thu, 19 Feb 2026 11:27:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hy+BuVS0iLVMRmhvOck3ZxPEwiAHI2ibXjhBmo6hiuo=; b=L2TYlkTPyyp0CHuc
	Qd9a43DHIZveEBAUgpBJRkPft2Y/7HgTN/a6SHJ5vrvSTY8Wg9JKJ/IRDr1fgYiO
	rfedf/9BjsRlfmzNH4nfJ1aBMDVi7njvd3LxpprgqCLUg7HFG8KgjZh9ENfZB753
	mNz1N51XL3ZxYl+0qKVSgT83PYozzTA5bVgltPfewmW1e5H3NTf6RTxNjXmsihpe
	IIt6M80GY6V2zgmoLZhFYeTbZ7piwH2z2Sy7xbZN+MUSAoPp1MPaJrbCnVY1Dngb
	lMWBr1pjo6xSo1xvyeI3+73idd0wkcr/5uGurMt/DSNDks6/ArNPQqhWP5nDmjag
	Kc2Igw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cdc7ubfeb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Thu, 19 Feb 2026 11:27:26 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c7166a4643so638122785a.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 19 Feb 2026 03:27:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771500445; x=1772105245; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hy+BuVS0iLVMRmhvOck3ZxPEwiAHI2ibXjhBmo6hiuo=;
        b=H+u/IklSc9dH/wGsAXDOiXNx6UfWpCBubGKFbqVG1o2HdPDm6wkx3gP40OX+oAWhnj
         iOdRXAc/TRSDvau0DvIIvWj3+lHVzDS437bTZpeKUAxvDllO6+pQHi9oG6kv6DyOpP5C
         df4rcOusS77oZP3oACy7/pa3rkp0so97O9VbfglpRPEXA+KqGETshVd9Y7mIi0pb+QKp
         x11H6STmlRoUtbawhZoD3nRgNr/1TOp4G4Jm4cmw805feYxejtLmEv5aIFL8taI/nwEP
         6Ytls+nGlVJN/joR+AJ/NW8lEnfZo2Pw5Lb0uQCLmau+/HPZMJJjqE9KL2heXDaLJCiY
         Bizg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771500445; x=1772105245;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hy+BuVS0iLVMRmhvOck3ZxPEwiAHI2ibXjhBmo6hiuo=;
        b=SejZ4XuhlEqE7bzs9xYHxjOwwitQUOXULw1l6tCwuvtVWjpN8Tr1DVZGXjuqXt/J9x
         GHz7UUCuOFWU/kmb+3lKqKraCDiE3V7W3Frin6w6JsJVMWrsKfkDJD5J7j5L2Mv74Yfv
         nhYL6WiRA2A0PzxthIzBrRfPmiL/gXyc788D+GObXRu3MPYIzTOYoA8cxZSi8823eqH7
         C8q1fwkE1oBWu0QesOJuCEbhJJ3mC8PpBJbOkF4a99eMRovsMNd8zxDlKmCLyQBATXSj
         P2lSKAEO05MKPiPfytYPULRa8y+9MlwVUv3jqcfA6vDapXaLnlgSi0qp1RDa2Xx/0Cgz
         GGIw==
X-Forwarded-Encrypted: i=1; AJvYcCWHVivGJez0OyBfDA4LLnnkG8kFCQU748f5DzFHmDr3btg7rEAgW4js6IsjMXy5lx92wyuRiEDzyOURvFURikyhnw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyWOlXdV6qErPVAi+x6BY36UOHSrwB8e3slMSeljrT8V4VUxV84
	rHoy6FbgL8SWQ0Bvk9xaCTd8RdiThWhWWmgmvWguAcbiFpPfqURW5s3ctHrykeP7C7B2QFH0+xq
	nF7OkUFOEvKwhn4A/YJBBVG6/629sSoqqIfUMfQhfqCoKSoCSVIWMV4yj4tQ3hUNVAo/5aJXLFA
	==
X-Gm-Gg: AZuq6aJ++ShrZWZ8ga1UUd/gZ9HBq8HdGK6Di6vT5tsyko27rCfk/kojyXg8PHhNGhl
	P+fOACkNgmFrsWU9QKutYS1fSRPebgy7WDbYJbx1pqhJs8u9CN2aNzDeTeNHeX72fDQcpT6IPRH
	+21eBFuRPyQvtrrPA+wdmQG0JVpasyQMm6d8dULhrd66RZSl6b7927E9wiRfYt4SrcXKsVb3fXO
	o3pFpP/xZmo8PxTsw/3+ispJDnt6rDTlBkcuETdswPknWvixIqTZxvt9dToNcEH1l5RHM8WFhsA
	vb+vHljKSeNfD3xh3XapJwba1gJxAOAOAzvixHAdx8/bfjQ0X1zP9/p21pI7lbzOMkOErnN/ju6
	nh/czYIbIhHjCsR+dbiZGBmwZ+B537YdlxTQsjucxAig+Gw==
X-Received: by 2002:a05:620a:4492:b0:8ca:4438:b8f4 with SMTP id af79cd13be357-8cb740ef205mr615678385a.67.1771500445314;
        Thu, 19 Feb 2026 03:27:25 -0800 (PST)
X-Received: by 2002:a05:620a:4492:b0:8ca:4438:b8f4 with SMTP id af79cd13be357-8cb740ef205mr615676285a.67.1771500444867;
        Thu, 19 Feb 2026 03:27:24 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796ac8d82sm48903796f8f.31.2026.02.19.03.27.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 03:27:24 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Thu, 19 Feb 2026 12:27:10 +0100
Subject: [PATCH v2 1/3] firmware: exynos-acpm: Use unsigned int for
 acpm_pmic_linux_errmap index
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260219-firmare-acpm-counted-v2-1-e1f7389237d3@oss.qualcomm.com>
References: <20260219-firmare-acpm-counted-v2-0-e1f7389237d3@oss.qualcomm.com>
In-Reply-To: <20260219-firmare-acpm-counted-v2-0-e1f7389237d3@oss.qualcomm.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org,
        llvm@lists.linux.dev,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1038;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=QDmpj9Mhi+yaAgNVbdMPNkUREhCivGToVpPYIMUn09A=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBplvOXAyCwdeeG60WQzcr9Uo+M3mkJDcWzTWLZ3
 kXMLJDmM7KJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaZbzlwAKCRDBN2bmhouD
 17aeD/wOR6DTrP+rBWdXbkF2r6rb3/tLd36u8MghhP0UWVrgi2z0y/jWoTssX+J0V7oPlxzXpCI
 cMgluqyML+MC9L60z4kTPIFqhi/AtNdC/8CVFU5a0Hx68otOv/K0qBDMJ077FvMe140HHGGnh0u
 kpO/PsZ0EJnWWzvZgqVb6M051BYBvsywoJdt16H7swNJHBnCLfBtK7aXx+Nq71u8405lw8LuEDL
 iZhrXgvWNZLN8mbNFGdGoZQLoKAbf3jbwoCLxRuLB1W66O5Y2nvPVw2vIszBoJaHfAJ6HM5rCAb
 HKqodL/5CTHrZBnnr/3qTltvJsRGisotNasGln36eo065HHND1/NQdUPEf1PInYEOZPsohYAu0Y
 tHPyFYJud5k6PQIrP1lcHEpkQnH0ggxXaVae1GMOEVf/DwsiO2XajyruDU2k+eI7idNY1AO86SY
 WNvog6SSmc8oZmh8in3yvpOO7lKGq3WMcYrvrUXfv7F8uB7dRRTHbti4hWbN/wfWct9ZatBDN+c
 6EKzxbtIuFUTi8QB+AhmcL2uZn66/y2PdJZb2xgsRacVhy1rrIVQl34XIpnmbC7Mq8zJWWm0kd4
 gK3mAVXA4SnwngfiqWpon86kStiZ8hVlMbBcAUCJ9uvr66DAjhB0orNeIRirQiB1ktbGltC1Ayr
 EEFtsxNfwsjn84A==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: BLckpCHgIPk7kdqEqCPoKEQuDTH3JT9-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE5MDEwNSBTYWx0ZWRfX38h8UNLZlCk1
 ZqUVjrk0CtGDKI+mbrm/391fR+hvSh9rtf0BjaTFI9c5dHmj1UBxjcctMAyChFJ184emJuy/QQI
 6OU967h8KQixbYRC2agsGQzwrO5RZ5wG7Bj5lhRALKpTFgoloBH/NOvig2rMeYG80XYfcxLbK4q
 rfYyfNBSIoIuhNen928bWLwpWZjNOkYC8pnJ+33vZeNDA0Iro5/3BJawd181b+Fa5N4bYo3o1Wz
 p/CaFnx08Bq95WL+++AY29d3rDu9+lq4/wZjaI6ErYRHonJAYR90q38fPm5aGQ2DK4m/hWSeHul
 +Q5YG9G3XgdWP6eh2D0aCRnY4WvyKjFLIVaGq11Ggu6jZl8HUwpwhzm09bZ6JIvTZLo2f6GRGgx
 futyUkSXkxDFkJDFRlyXhJcYJsPlkXa5sg7s3oYmh5i6zdqIdrxGSoHnyDfgw3GRAo6Q/JG0PF4
 qC9lz6pAmxh7woq8XRg==
X-Proofpoint-GUID: BLckpCHgIPk7kdqEqCPoKEQuDTH3JT9-
X-Authority-Analysis: v=2.4 cv=daCNHHXe c=1 sm=1 tr=0 ts=6996f39e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=ba0xTr4slAEstdPKfgkA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_03,2026-02-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 spamscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602190105

acpm_pmic_to_linux_err() uses an unsigned integer obtained from messages
as index of array to map them to error codes.  Array index cannot be
negative, so make that explicit.

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/firmware/samsung/exynos-acpm-pmic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/samsung/exynos-acpm-pmic.c b/drivers/firmware/samsung/exynos-acpm-pmic.c
index 961d7599e422..44265db34ae6 100644
--- a/drivers/firmware/samsung/exynos-acpm-pmic.c
+++ b/drivers/firmware/samsung/exynos-acpm-pmic.c
@@ -41,7 +41,7 @@ static const int acpm_pmic_linux_errmap[] = {
 	[2] = -EACCES, /* Write register can't be accessed or issues to access it. */
 };
 
-static int acpm_pmic_to_linux_err(int err)
+static int acpm_pmic_to_linux_err(unsigned int err)
 {
 	if (err >= 0 && err < ARRAY_SIZE(acpm_pmic_linux_errmap))
 		return acpm_pmic_linux_errmap[err];

-- 
2.51.0

