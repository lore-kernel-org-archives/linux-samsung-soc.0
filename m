Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 497C028A1E6
	for <linux-samsung-soc@vger.kernel.org>; Tue,  6 Jan 2026 17:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767720712; cv=none; b=tlWgx3xLvyatHE9izblvf4R1ZEbA2uHBR2/bbiNpe4Y4kekdk+Cr0xDUyff1+emNLawU8Yp0UEqrPMzvC54SwAD0cdVpDKb5PkDW7HdIlfaLZ2GD7JE4q5EnNL/07AB8d4FCZTi6CCvNrzX9fs/9hvjmQX/DDPiXG+22egpWOCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767720712; c=relaxed/simple;
	bh=EGL0IOjXzoy4ERSdqnDv6XXP02+jdc63zjGvHi+5D/Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sYnp/7XY1cBFWrA7ymgB6t9dGwxhr1lrPn6zST8xHeMsBj4qBJDbB6+/yqhrEjbNziC+xIY+tPN2tvnubtI4GupRNTPQ0H9dLexMWypOL671Wpn1ADpyORRWkZ0yWBqC5j1Cd4IvcZ0uC6xXTINMy7zymjJJyA6TQ4HBgsOrO5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g7Tf7qlm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XvJDcQxj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g7Tf7qlm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XvJDcQxj"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 606GiqQh959393
	for <linux-samsung-soc@vger.kernel.org>; Tue, 6 Jan 2026 17:31:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tR7f3o3xDPesUQHU2saQhPf2
	QeydtE64EkpRoTZj7tk=; b=g7Tf7qlmPp+umH1OgIEt2FQrpO5qwZlUUNF3FQZl
	HX1biqamPP+S3QFifEQzy9jaf2AY6vUJoF35oiXAOiRcf7HT/JpD4/pZg72K+t3C
	meDtBuSkuPUtpQRnlMI+BCeSgCLoRWGj5N8RRhOo6SsvbQAXRKQ5aOtEhqcE4YPR
	ygNhShsgBjdp+RDjAGGEWH+YOvuR9jhO2qYJ+ElfM8hMEzKhE2ZNzViBqTb49Tjw
	g8keG8le3o/HfvDI8obGawr+Rnl4TKuHIH1Kg8+DmX3jYJUlfvHZ3VLXqFo4lL1H
	x1kiM89xYc8xh3TUYxYELjFWUpGO4KxiTuAZ++/yYVIrPQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bh66er4qj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Tue, 06 Jan 2026 17:31:49 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ed69f9ce96so39292091cf.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 06 Jan 2026 09:31:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767720709; x=1768325509; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tR7f3o3xDPesUQHU2saQhPf2QeydtE64EkpRoTZj7tk=;
        b=XvJDcQxjmUl9PQvjrfqWiI1d6VDwVLqZPQnlBzshVMbkjnzywXWq/ahFZvrVIJMEI/
         lqudWxQQC7y+FTP2ZHB0VvLVFtPnQsyxPwg1LCRZnop4mhdx8VG/y/fbtiTAXO+rnA19
         wQuWVVBV865uubC49NW75wK6chLa85b5Qc923U/4zGQMUVW0YWXoJ/zw8+f/8e5H2B/d
         omrKfFqGPVlRIWVTRWomIcbFGPwmFxiyzpoC9p0vYMWT26p5pMz9v89oUCOCoGZrKq9E
         CRMxK6Z9Hj3+kLujrHEsIs5AKQ8pYcYHzyY7GmgAbincwqV73yM0F8SY/p50IpD0uXyb
         HTZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767720709; x=1768325509;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tR7f3o3xDPesUQHU2saQhPf2QeydtE64EkpRoTZj7tk=;
        b=Gt2U1hG05lRqMEv1KYkXcnBQa4oZQiFGfc5hc88GaHe+Y/KSLuHU3mw26ZemZAKrph
         Qt5TeLrDq/upOp2+2ozQfZvL2D+Uw7eb7ZWooNjoobpDk5oq9c3WBwLLPbb8ScIbm3PS
         3Uc+UrK/knGE66I05ovt4SBSNjJ78FFEpxcn38dliyWPLkb3+QJu/vn251+VuUfFh6/Q
         R0Z0XoiIdAZsofH8BpZQoHqwHUjSolIQR4SmAiXdux16rlxHoNtUPvxFw3Rk43o07tci
         F2Gwo8IIm0lv09gMC54rwCAMXGC6bkjex+u+ApuyQsPmVjqunxj2dZcGNtOxX0f5LJFU
         dVNQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1Nx/qYwa6ySEEPC9GB9F5WmqRL+hR2zxqnyeUhswAR+Cd7tCbergZSacAI8LwVIp3luxOHAdxweES3dFY1bwEQw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwreJFJH43n1OqjIiFbz+P89W2qy8vUJCouesVZuHr9GQAozcvx
	/l0Ud4D+33oz8ZIIMhvumY2CLeP5CEgVdGFwfikfIBOqPxrkykFscA0jIODeipqQNZ9KP2jJc7M
	lK8BG7R06y4PxxvxAXMyKF87LI8X849tEQfhygp2c+jIgZHKxDnh3K+GBOSb8eVRJrGUL+p303g
	==
X-Gm-Gg: AY/fxX5orf42oVloJ6Qkk/PG7u+m9gMjZ4ygTAN6pB1byMBVuZS9S64khWn1iyc9K0T
	OvaAy9xwqNNgUxYWdd4Dn87T9HYPGwDZe4LbY2wk9RkxSDgpF5Htjm1w67eZuDV62rwMByWRQ7a
	sVk5J9+bbrUFP7NG5VxRfqt5z5p5r82DNqAtlBggT6cstyQaTVBYbsebe27jKO7QBrd9Xz2OINl
	bWf0mDPzl2rCKovPAqmX29lgroL+Uc/ApwazMlxmfVkSA4bR9Nchmgk9T7qBq/RqgOm5AlZkdFS
	vmRSHzZEewPe6jR8W354HrZSSt/3ahEeF+zL6FRzHKQSzeoLZ0GhRa16JhlpeZBk1m2dGD0gZ1q
	v7kXQxYTn77R+KFHmx5eQ
X-Received: by 2002:a05:622a:60a:b0:4ec:f969:cabc with SMTP id d75a77b69052e-4ffa76a115emr42210961cf.10.1767720708492;
        Tue, 06 Jan 2026 09:31:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHjf7OwaOn3HaZf8IWNrZ2eDSIxGAY9pKKIzvqd/zwCSP5LN8zraKCLgL67UkescNPyjj5pgA==
X-Received: by 2002:a05:622a:60a:b0:4ec:f969:cabc with SMTP id d75a77b69052e-4ffa76a115emr42210511cf.10.1767720707970;
        Tue, 06 Jan 2026 09:31:47 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.7.10])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a51183asm282053766b.49.2026.01.06.09.31.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 09:31:47 -0800 (PST)
Date: Tue, 6 Jan 2026 19:31:44 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@google.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>,
        Russell King <linux@armlinux.org.uk>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Nipun Gupta <nipun.gupta@amd.com>,
        Nikhil Agarwal <nikhil.agarwal@amd.com>,
        Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Vinod Koul <vkoul@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, llvm@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-clk@vger.kernel.org, imx@lists.linux.dev,
        dmaengine@vger.kernel.org, linux-media@vger.kernel.org,
        linux-pm@vger.kernel.org
Subject: Re: [PATCH v2 08/11] clk: imx: imx31: Simplify with scoped for each
 OF child loop
Message-ID: <x2md7iusj467bjmmysckbkehooua3he652qqwr3yzaoka4sjm4@pk6uy7hq2lku>
References: <20260106-of-for-each-compatible-scoped-v2-0-05eb948d91f2@oss.qualcomm.com>
 <20260106-of-for-each-compatible-scoped-v2-8-05eb948d91f2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260106-of-for-each-compatible-scoped-v2-8-05eb948d91f2@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDE1MiBTYWx0ZWRfX2iE8QTpusM+8
 DCZki2bhF9ppNuRqEVwjaNGYCfx2c4JZuCgTgab2LkvJ9KSaFcdycFJ29UXt721LvyIfSSd3TPM
 5H0oh8NzdCQskDW6bilJ5WcB2UmEjYWb9Sf4xMHdxV8dUnvMPm5f5OCZDypgzW56VfrYVfWbOg7
 LSuIe3wqo+iSpoJZwwQFO1zODJVnyBML7n3+oNIvNvnZbjdqWxPN1u+B9yzxKyJfcB79vXQomr7
 5tLuwad4hSGLxoyrhmjFTOdTg88T9CxOjdOeY0o92dbLPbzHpJ2Y0Iybb3/OJev964TIUckoy06
 xHv2zDxgA5FhVhrcbfZJVVPial5pr5fCd7MiGAcv0Vjym8MVGdeZt3/CR70qGqccMpaXNp3OiUJ
 xiMvxh2YW/C7oj2J0kQ4pUcWkWal4JCECylEc+7QIDlxF/9Ubl4JHoKvjsW6W5egIEj4nE+uWzI
 2Hb0mk4IiJYWii4VTbw==
X-Authority-Analysis: v=2.4 cv=HccZjyE8 c=1 sm=1 tr=0 ts=695d4705 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=hZ5Vz02otkLiOpJ15TJmsQ==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8AirrxEcAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=_Ixbbux_C5oTi3JCwyIA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-ORIG-GUID: rsuZ6OmY5LFgi7DJG-QCRWK8d3_4Uk7o
X-Proofpoint-GUID: rsuZ6OmY5LFgi7DJG-QCRWK8d3_4Uk7o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 spamscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1011 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060152

On 26-01-06 10:15:18, Krzysztof Kozlowski wrote:
> Use scoped for-each loop when iterating over device nodes to make code a
> bit simpler.
> 
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Acked-by: Abel Vesa <abelvesa@kernel.org>
