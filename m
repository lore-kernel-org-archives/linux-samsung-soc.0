Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793886985;
	b=MdbnpJF0gxFy3/rWU4V0NRUsaVxvmW2l41cxmEL0tD/qJpufZIzGUS++6IGO8YmiMYBq
	 n+BlbxG8mj9r+xxstf2V966nFqrwD9P9/BOd6ii/y10DxNH3WJEgGoxrl4eEkqRaLkOJv
	 62TXy3vS4rGs57uDDMMWiwiVCGBWn8tVTOa5uSsRxK5NaebcxGklQ0TY0ds8TLSoy0o29
	 dQJLAVx4Oo0eOnmCLntjiIgZXMKcGdWpPOF7wrjt+qQSyYpjBcEDhidCRYdg7/ooab/5A
	 HBlRnEgXe+yTZ7yDsEmbkDQv7wuCbVsJfBYQ2Mps8fOCRNqOCg6ZBSceyXhXQ9OTzPw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793886985;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-OriginatorOrg:X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Reason;
	bh=+82wzNLUCpmDYtFvwQDzsiH8DkIP19TxPmcHCz1swho=;
	b=jx1xZ6N4TlraBH1qlq+pyV5L8IK/en7Abx9tNXvoBZ830bvM2tlOsBotACrqZar7CyNw
	 JKUDZ9jPKTaSzlevBUk3g3mIZCEjx6eZq/eiDoWQDYcPSl+f4yMutTh1CsN2Rm6hgeE+F
	 CRdIazjfwGyT8OMozLIen9TLmxV90ZjhSIaR8RsFFPR0Og9apTye9BBm45LMaezSNrqw3
	 aDZFkXGYrR1fEKKr43E/b08crZd0nBDSxfvEdfT1kA8czycp3UHD1JrUhADd0yUqr/Pbn
	 ybK4Eoz4SL1u6HnqqYLaKMf9zKbb8V8RUJUOiOj6xXMVI6ePSL0JZjvKbY/m4nY8Deg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=aPccnh21;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=VggsSres;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 892C5606A326;
	Thu,  5 Nov 2026 13:56:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 892C5606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=aPccnh21;
	dkim=pass (1024-bit key, unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=VggsSres
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5DM5H31567510;
	Thu, 5 Nov 2026 07:55:59 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=+82wzNLUCpmDYtFvwQ
	DzsiH8DkIP19TxPmcHCz1swho=; b=aPccnh21xPMsKelww9MO2ycrilbXcK2SAc
	pRmAHpEde9mQD2eU28RUdEwp/jIQx7kfvP5kKV5z8/apB+G1ByD7Z+LBOICqI08b
	8pDwIvpaRQeyfhhjQmUYM+f2atKJsMnO1FdPXt7P2GiP627OCYYVOkVX+VU1G4dV
	+gHE8e25lO3X2GZ6pmkgAYC3sZw1qf+Vp9f2SYxOJtltiL/CbeudcHJ2X4G9s/xN
	EkO6ite1IHI0125CrscnX5mEaM3RXid2EKG7J4Ki6h72oQcx+oJmmE5QzmyxguQf
	IkPYak7FR6Z+CQ08N1zdsjZsrS9iOZOWJ1UbbCXclajlT1i4zubQ==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11023124.outbound.protection.outlook.com [40.93.196.124])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4hr7c79p5p-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 05 Nov 2026 07:55:58 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TG+yi2icLCuakfSgaYIAF2+MUBkr2JXwpj9GU5aZ0OoQTrXm3aBsKXIiZtuex3bHPFtjQAX7RT6jYUg9jTULfKrCsgHY96a5SjbisgjypyliXDs6yV4MjbWtYkUWmI4mB+CsuhU6ZfIlGiI+FVHYaRHCUsyFGVGNPDfsYgMlfXhCtsjNA4Ub3pbzxpEauTBJpw/EuXki4qQuC/s6iJHjkASwtguevpT08Wyk0L3vCK73fjx21D2ldhCN5MlVrvbtGZ8lsiO6PEA3uhyn/A3Jn3dlPY9R3S/rZTQz1UFAWRquH+RYqxGmX5eZjAQAY+hQbyX5TmA0ysdgxWawUheevQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+82wzNLUCpmDYtFvwQDzsiH8DkIP19TxPmcHCz1swho=;
 b=h0FsI1KI1lK1IvtD7h9JMoiIYOVHUgyhN/lyatlkkVzZXCq75vRFvpRbnfQWAQ/5ecFA2DeXIr9nvRxtNdyQHPlzIqu1Ls9Q894f4Jcc/0vdA1OiA65YMYazj1JCcvl8ln7K6sR1Z+q5oZunhK1ykodlpTJFGKASbkoU++MNc8v+GipWMkAH0YsVMDHyNngPsp+NECu9gQOPEXoiyb9aktGgMDIxmedQ6wQTyLBz5MmJm84ArzHr14cXpbYOUFkp/v8PeE9XK1rt1eCdgRx98nr5TAvahg38kLFkBe9g3AIVajlckM//lmzx/aSpvtri0itYPyvjISBB5c5pA3GiRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=armlinux.org.uk
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+82wzNLUCpmDYtFvwQDzsiH8DkIP19TxPmcHCz1swho=;
 b=VggsSresS61se7UGIOpSh2Gq/4M2Yiil+BP/39fUAkJPsTwwRoNZIe0ZnAO0183DbGhfELQBO+kEJ5OCIDhdZqdih7yHqyJ/sDxvdHpDf2YHc1AD5+zu8q7IkBt8rdjjKKfkJj5jkLHclGST/OOod3r33xLURTVkGnFd5AkSGhw=
Received: from PH7PR17CA0036.namprd17.prod.outlook.com (2603:10b6:510:323::20)
 by MW4PR19MB6959.namprd19.prod.outlook.com (2603:10b6:303:222::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Thu, 5 Nov 2026
 13:55:55 +0000
Received: from PH1PEPF00062F23.namprd02.prod.outlook.com
 (2603:10b6:510:323:cafe::19) by PH7PR17CA0036.outlook.office365.com
 (2603:10b6:510:323::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Thu, 5
 Nov 2026 13:55:55 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 PH1PEPF00062F23.mail.protection.outlook.com (10.167.243.52) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Thu, 5 Nov 2026 13:55:53 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 81EE4406544;
	Thu,  5 Nov 2026 13:55:52 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 5E77A820273;
	Thu,  5 Nov 2026 13:55:52 +0000 (UTC)
Date: Thu, 5 Nov 2026 13:55:51 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Lee Jones <lee@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Russell King <linux@armlinux.org.uk>, Mark Brown <broonie@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
        mfd@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, patches@opensource.cirrus.com,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/4] mfd: wm831x: Support software nodes for DCDC
 regulators
Message-ID: <auyK50dqvwxIGIar@opensource.cirrus.com>
References: <20261024-samsung-kp-v4-0-e21253295e68@gmail.com>
 <20261024-samsung-kp-v4-1-e21253295e68@gmail.com>
 <20261104181429.GE1650678@google.com>
 <ad02069b0cdede7ae191e4a3df57f33a@gmail.com>
 <20261105085321.GG1650678@google.com>
 <85817548-28f8-45ed-987d-a4996c2bc4ce@app.fastmail.com>
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <85817548-28f8-45ed-987d-a4996c2bc4ce@app.fastmail.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH1PEPF00062F23:EE_|MW4PR19MB6959:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b6be064-81ff-4a9f-cad4-08df3b44825e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|23010399003|61400799027|7416014|10067099003|18002099003|16102099003|22082099003|56012099006|4143699003|261026121527099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	xidxnwrLYAy0N7fKPMwNuQY+QlJ4G+c1kbflrYf+2DcOoot/ods9N29QUqii0Wx1DqY5jjzZE9TrTEenXvj2jgbOjXSyBtP3HCpfKkMOVqrbJeVKHwalMnQeRwSTdEl9asV+AAVhyXl3aY0qYf7/ocuSCx8OaVsLmqOsrPd9xeXW8lXY4/8pfbWMz2yK6ShgfZaR0NC2B5ON3PKWqO17miHS/H8OnD5LLPu5LODR+HLYjT75gsnAA0MVsjeIBaGIOvDdYPmvfrd0dqYEOVwezNdb7kgrJL0LEUFg5mC8/HUvRW6peVtF61V1T2Rjphmce6n2eRHy2l8FvI9bbqAoy1g++tEOB7QCi/9HAOlQGG3DT+sXsa8Qz9odnDFXwHgqCP0jOeMfFduCZWuxeXagHiHa7evhHQUOxc9R1+5+t+CS50UWU0PqVltSK8UtHMHN3M7g3gXGux6NooAy4zGIiMXsnglyFwrobGyYxnerXkkQZhF0Cb4zfro/12SsQMApSlcdyFLxynVkaSJLFt/J3Ho4EYrqcA9NXU9+SK7GbHe0tge+7WCRhpELQ68T3geNkX2d41+1nbKK/YOR3GAUkYsANlpw9onSlletpfLE5iHAOS/xWZwH1cqrfBaxIt8s4D8oHlPuQWBgND23PtYrdKmYD659TkzQEneH+mAnvJV6wo8yT3tbR/m8P22HIKNPCiuNs5Bu4i/URMbVuuJZfw==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(23010399003)(61400799027)(7416014)(10067099003)(18002099003)(16102099003)(22082099003)(56012099006)(4143699003)(261026121527099003)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	HbWq4NapxVDQm3A/46l2s4DPakbcBIYegtxrW4WVcBtfrgFNkkrfT74hwdYfad+cb2erTo4Zid0tKjwtgFVHAuAATbZGN1UKFqwsZ8FXkurMyNQPfECUFzfiPdz0j+jRTmMK4/dQKCAYm4HB//UVv7hfNKwst/qteC2uX83HKzAV9xBBoIcbVNXoQeTokxM0l1SB42UmD1oCU11gx7JceSKlBeKQwS+kGgY1knSdY4cbYrE6O8on+l6DzCGl21Furqn6rlpZOE2E4f6TLPSP7roaybzkKPkHIPesRIgHCzZFpG61hJRZW7WGv9MCGG8LON7l842dA6Hkg8khj9k9tiJsMbH/dtqhhKPGzaZJmYOUhpvXXKl7QPcAtHi5pOgDnAsRCkL5Nms5ja4mLjRxxviwlQOmlPTOqq6F6tBP/tyoPk8Nq/suncc+GMH6LO7y
X-Exchange-RoutingPolicyChecked:
	UEDmJ+41sbXzX9wyzSVlT0wh5fRCZ37IVkdDYe9lgc3M0LpiwDO2M0cW6U8WwuISvD6tB8uuoSjnl23l1gNBBSoWrVXmaCMgNgArdL9XMieJ9uYWFjHQD+QP3XKaAW1VMCMB6DpCvaqbTQVLgdzQprbj5NYuawT6oPGBM/f6kfiuVohCsOJYx4yCmAWZq3ahCuMokeh3AiS1pzVNpFjmZO+6PSDnnLYiKN5NirckOa/td8th3kJ6MsI+4aZqt/tnqpzyySyXEk3z0ADguIi58pFUsdGP0saMUAQdulrVf5dyKlLHn5QWfzEisuluva4KI0toOyCJpCaA6dB68sfS/w==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 13:55:53.7927
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b6be064-81ff-4a9f-cad4-08df3b44825e
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-PH1PEPF00062F23.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR19MB6959
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA1NSBTYWx0ZWRfX9pP0H02TQH0v
 a2iZ6ZLw38P5QumRqDPfNEv9hjDZTc9AX8mQ7UwSzxtBaJvKBjxwswTj+WnJzEDwAzLG5GtWA6W
 +BLwUdB0p7aDq2Ex7zcUJlv0k7/Lq9l75ysnwWbcMhQbBPl0c59/1/mMSqawveG+u+0/OdZAdDk
 0vHF/C847/hCSrS6J+GWFj5K3kVn5HitYxHfGbJS/fnHGrI/Nx0BvalJNGyf0Y2Eq2JPh9bY4yE
 l8aLl0pCdVAZtKNyEQpkoHcanYOT65YrzUKcsGBY0nyruaReVR2bhyRZ6Tod2ufO7g8J1zOcbU3
 24kSAyDiSyAixG54TEdlLkxy0g5FjYh4nCGKyt2ssuCEK4+oc1RAp1Q+WXXhDnNXAJ6eRUNrsvY
 qZPxp1zJqAxpYF5gafzIoUXdBkHGX1AvnElbvWZP+qg4BHQJLqNYopK2lDnboS0cQ70iP8OJCMy
 ez0Te8+GU3iZuSlLo/w==
X-Authority-Analysis: v=2.4 cv=Vr62kO2n c=1 sm=1 tr=0 ts=6aec8aee cx=c_pps
 a=srDlnNS4+718ntrPETSvAw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=jEIcUu6Nku-npfG_z_kA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: 1RmdKLw6J3d5B4YPilC5BuleqTnU8Vz_
X-Proofpoint-GUID: 1RmdKLw6J3d5B4YPilC5BuleqTnU8Vz_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA1NSBTYWx0ZWRfX3kDBI2RAN9n7
 LGf+fJBAoV6f/064AEPTnl28OHbwiJAGGiu7s8FbDGSDKkaPQWmT678Dp01cyTE9JrSk9vd+oxi
 Sxrnu2x7vo1ms/3Z6Y6la3lJ9ubYK8s=
X-Proofpoint-Spam-Reason: safe

On Thu, Nov 05, 2026 at 02:43:17PM +0100, Arnd Bergmann wrote:
> On Thu, Nov 5, 2026, at 09:53, Lee Jones wrote:
> > On Wed, 04 Nov 2026, Dmitry Torokhov wrote:
> >> On Wed, Nov 04, 2026 at 06:14:29PM +0000, Lee Jones wrote:
> >> > On Sat, 24 Oct 2026, Dmitry Torokhov wrote:
> - if there is a reason to expect any future user of the driver,
>   extend the wlf,arizona.yaml binding to cover wm831x as well,
>   replace all the platform data with swnode properties according
>   to that binding and have the drivers use those.

I really don't like adding wm831x to the Arizona binding. Fine if
we want to create a new binding in a similar style but Arizona is
a binding for a specific series of audio parts, wm831x predates
those and is a pmic. Trying to combine them feels likely to cause
problems.

Thanks,
Charles
