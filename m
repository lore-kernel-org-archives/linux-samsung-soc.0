Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793959020;
	b=fUlAcpiH+NPPkgUbLC3KHPb6+MUpUdOVFM5Msd3ppZ9viELwL2uR4LpNDR41jGL6JpVL
	 BtvRh84r/jnccQwWw9MuiIv+MadmiePKrvC5iIIv+DSWk8fStqZX+QnMQ73KBp0xsRIsh
	 EHcuZxXyMhSEJTDnMPfdwXC7yeXPl06hxMGlHvM8PPOuRVx2VEmdumuvsP4UD83ZsNn0E
	 haLAGjF728ZuczXQk0kE7Gxyne88UZ0Bnuwe1ZhPUTAsoZ/FPc2mLI95XW14h+3eR0oS9
	 V0F4nBmnhg9SU1bk9x1CyKOlWocsz6UUqwrV+K/6BKNQpQIYDJiM1Rc78Kc29oW4xPg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793959020;
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
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Reason;
	bh=667ceIOEwUK9IBQJjmSZgfUKjSJi7uK/nF9EUx0W7qI=;
	b=0mhVdgJH5jWeHYcCm9JkVY7HZ8hC1HRFoGNYBZKGn/IzOs2mjy6LOta/ijVRqWlOT4uA
	 om6WAD5ZOlNWZQ8T5EZFtcoCw0DOh6jBPgV8NfXH28pb3cE8Ro9UMAvz9rFPQcVFQOEaP
	 WfMx6ipVuRakv1ZRW35tti9P5LHv0FUx2SHJ3jwHRIkLmrdE7HpQ0t6dGBTR5NRXxJP8x
	 Jp3IGbt7jjbtfbRrpf77CxMUkWCUsTAy5sFp0zu5JhvMpgWWqbACL7GY4f/L0YuT6QfTE
	 w9NuzcS8EZ1zymeb5kxjRhJ+SYbZbtkV4veZ47LESujy5sEPSlI/izpimVl6EeJ+TdA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=GhYBTzkx;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=Ws86cQyA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A488606D829;
	Fri,  6 Nov 2026 09:57:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A488606D829
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=GhYBTzkx;
	dkim=pass (1024-bit key, unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=Ws86cQyA
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A69HRbK3497909;
	Fri, 6 Nov 2026 03:55:27 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=667ceIOEwUK9IBQJjm
	SZgfUKjSJi7uK/nF9EUx0W7qI=; b=GhYBTzkxVjyIg4cGYJICqztT3pnDAbxBud
	q3Gzn4yScK925/xJS1+/ubTPP7pYvpb1bkBEK9xDuCRz0X94x9M9pqZSusqYiJLJ
	fehSp5iVLoPfHsILk24bkzIlfgClBEg+mZIjI4tsgNdPk5W7IVuV4ER1LZJWBoYg
	tA4EKKZUNJixFEcHA2vIpP8CkTggiYZqV5wXmn36ldOyc4m4B731/9FUiIuzf7ef
	tUBazNLu7r8mtSgZ10FCZjlZj1Fmui+nlVNI3YrBK22VuAFMGezkpUgD9TsFI6Xr
	5xkpAtQMdccMuBNXTeQDXDokIKTZ2yKLAIMOYZjznuouIJ0dlLxw==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11020074.outbound.protection.outlook.com [52.101.193.74])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4hs3rb0hu4-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 06 Nov 2026 03:55:26 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jndk4f8nGTAR2YxkAhAaE9UFkGO0WOpzwL/Sk7kbLmT1KecEzVUzYTGqZEFopwKHCLwdO1u54BJfIzFaJTarZkfpWXLij3WWWWG92u/Q0IH4lJh1qOHNx8amLg/homCu/xFy4AOXCKSSGPkLoqGB0w8x4Edp06fSFCJNHJql+MjXEp5qCCVA+08eKlE3Z+GojW3ilEaqA6fVBTPfDcmfjgPuVixx3vZdspi65qeKI/uvp8jiNAzXXODv2eDQCghJ6JN8H045nPao+24zVUjo9th5tWSoTowBQsBCrOL15Tct3FQmDBDw5J8nxEDa+H2Qwtn5NbpN2T3AetA6YQJ27A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=667ceIOEwUK9IBQJjmSZgfUKjSJi7uK/nF9EUx0W7qI=;
 b=hxvWoHCJP4rwFBWKmmiBbl+JNhKUHbLbUPaLlo977vguIhIbQ2reDfe30bNg0p7EQaeY6QigtVhSf+BK43icJuyuvQiNrP4tQCV18aohl+1iA5mV8E+n4tD0gnVga6R5MavQfjxege/0G2qAdYHCMt4jadu9dNEmt7+dryhFbya8VrRKNkgaMWEeDpEHp6KHfdN0bFzBLr9QYBaXikoEB9E3TAZsL6xUQeO+Yah1saPpxmUyXHFCJt525k23DFwftYoDY78vBEIZJSJOjkJ2BS7l0AajmrZNg5U/dUYQex0ErGavQCGpUxwbxEFTEeuOlE9lfNVhw8NOvbT2gn4gRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=armlinux.org.uk
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=667ceIOEwUK9IBQJjmSZgfUKjSJi7uK/nF9EUx0W7qI=;
 b=Ws86cQyADTH7hf8yZsW3jCOShfjrO1hzRLNmK08lFpzO4GLx4rZT7WfE/Gw9QtkpWjFP66kBVKIwPdfmCg9Lt4YoKqTVOh3f41cezyzWXEJNfio2JqfNUiw/8DXznMwtdgZo78ZZCzJmCdSz5TuO3mFz8TF4BEEdbWv129vUTso=
Received: from CH2PR08CA0012.namprd08.prod.outlook.com (2603:10b6:610:5a::22)
 by PH7PR19MB5703.namprd19.prod.outlook.com (2603:10b6:510:1e2::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Fri, 6 Nov 2026
 09:55:22 +0000
Received: from CH2PEPF000166C0.namprd04.prod.outlook.com
 (2603:10b6:610:5a:cafe::af) by CH2PR08CA0012.outlook.office365.com
 (2603:10b6:610:5a::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Fri, 6
 Nov 2026 09:55:22 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH2PEPF000166C0.mail.protection.outlook.com (10.167.252.10) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Fri, 6 Nov 2026 09:55:21 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 26013406544;
	Fri,  6 Nov 2026 09:55:20 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id F420D820273;
	Fri,  6 Nov 2026 09:55:19 +0000 (UTC)
Date: Fri, 6 Nov 2026 09:55:18 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Lee Jones <lee@kernel.org>,
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
Message-ID: <au2kBlSsypdsdQve@opensource.cirrus.com>
References: <20261024-samsung-kp-v4-0-e21253295e68@gmail.com>
 <20261024-samsung-kp-v4-1-e21253295e68@gmail.com>
 <20261104181429.GE1650678@google.com>
 <ad02069b0cdede7ae191e4a3df57f33a@gmail.com>
 <20261105085321.GG1650678@google.com>
 <85817548-28f8-45ed-987d-a4996c2bc4ce@app.fastmail.com>
 <auy4Qbxg-pW_X37E@google.com>
 <9fa9add9-6bba-4cd9-9f15-d6ca222a1a23@app.fastmail.com>
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
In-Reply-To: <9fa9add9-6bba-4cd9-9f15-d6ca222a1a23@app.fastmail.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF000166C0:EE_|PH7PR19MB5703:EE_
X-MS-Office365-Filtering-Correlation-Id: 89003289-7295-45c6-3333-08df3bec1230
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|23010399003|7416014|376014|30052699003|61400799027|10067099003|16102099003|22082099003|18002099003|261021121427099003|4143699003|11063799006|261022075727099003|261026121527099003|261102123227099003|261026140227099003|261028144727099003|261021135927099003|56012099006|261022105027099003;
X-Microsoft-Antispam-Message-Info:
	obBZQomvlx59jHh3u9cu2HHjSIN8Hw5MnI2osJUuDJKMEHLqZUNCRBjf5FxkURF0hdL1WaS5ElN1+z5vMc0fF7ehvtvUKgpV2EubNs4sm9YdWY7g186KZtXQj/kzW4uColWuC0ZwIStbq4kYZ0p4mHN5dQ7Lou/B5eItou+VP6r/ArY6v+csQQZQTp2/HGW4KURQzx2DCYPoADhqzmA25lRM3ZcfMR5BczHGZG59kfk6eNMxIlwTXdKria7eYHhqG0yORVelqg6WBGxGCieJI3ezUzmW1pcixVfLGwj8roeEFMo3NS9l5H/tkg5OCK0LrGdSDoB0bII+gj3t4lXDwpKAQqfgzLTOZxEzBSZfv6BTNEcGCfFFjRZPU8dj+Epseq4IfDKsakKGFAs4AmWLUd9dllbmcFm+wX3YCnwOLvzkkLea5c//9+ndxiPWo4bqSkXnrkFe+SjBG7NYz25UwHN0jT+42ib98kBCwbAUSKohRp0S5N0v7BE66kWk55q/yU1ijskR2dUnZgyeymMIY0om6aKrd83UrA8QuZjRt9sVeButvPI9Xz5xwXRe2Jb121F+x0s5ZQqnkB5/Njpm6v69nznfMPrpwPPESjfovEPFsSCeC03yLb7pxydyKgZ6whJSZkXcT5whBTR+mE1FXdKsalpuUboS8PkU2PPpzYCM8rlRtbS050zbna5pFm5TBWcKPgjRNS23abO0D++vpQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(23010399003)(7416014)(376014)(30052699003)(61400799027)(10067099003)(16102099003)(22082099003)(18002099003)(261021121427099003)(4143699003)(11063799006)(261022075727099003)(261026121527099003)(261102123227099003)(261026140227099003)(261028144727099003)(261021135927099003)(56012099006)(261022105027099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	HlUUEVxiuNnJoQT3vIbuWfwgkB5Ql8T26LmWI7tDdm/PDlbYb9eUowJpTk2MHlTS6F7+5e8o/SSSQ63/FtyYxlK6Ng03BnBLjcXDPEYIG6QCLcRsBDbZS15ZTcSwCW/McNePWR2podIzK2Hu4qppp/i4V1V1dSmJDc+ROaTbpqxoTL0k0Kn0FVR80fS2WvUSw63RRj6v0VveCTC7rtv3mk3S2n4E9dqAbUUPhkJfYWIvXZyroxMYW9DJhVgtCWrkuFG8DPtvc/GhZ6HDazFluvk6uporBVkPnH7G82YR8RQYDph/Gg0Op5K6Tqhjno2jxt9VTc2NiuIcVhXHuXsbIHLELrbkThx1OE9g15N1EdiDYPIzhIefRyLmZI57qQoJrKiU1AA7s1OGGK2F6qDp0O7GgQ3oSatqJfBPNxbqQgOxLJ8Q6zcY9up/5t/lHcj+
X-Exchange-RoutingPolicyChecked:
	MmTPDSVH7VYbKIvQr6MHm0CS58KXslWBnT4rZwO7qW2dazX+RyWyQQ7inKgB2w4A7KtEnSu7wVCCSyKzQ8rYXcvGaxgpewoX/lKGrWvnwjpuOE6gey+xkp/PvRqYdl4HyQCwmR+1qxWSDN7JkDQc9YVwqCmUrcRCcyrC9Jwt12lCwsG/ALQ/fJJb1BxRNDE4GOuAUpcZsM04a1pVNWNZAbG8tmkkW9hE3WQcRHued/fmukB2CY7Cvo+nL7logLXgYvPrjFTZ+UsyMnYLY9SHuH6FN90LyCqCd3+1t2fJwWYUfv3xvERWLhqjeBIjLY6XI4qUMm0QLHtoDEqm4ux7rg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 09:55:21.0997
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 89003289-7295-45c6-3333-08df3bec1230
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH2PEPF000166C0.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR19MB5703
X-Authority-Analysis: v=2.4 cv=G6aJgNk5 c=1 sm=1 tr=0 ts=6aeda40e cx=c_pps
 a=1AroyRkDHmFDIQmzFtfJ8w==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=_PqjmCDASnPxqwVvx9YA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: mkSiAPpLaLXm3H41wM_yozL4oDttydmK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAzOSBTYWx0ZWRfX56chczcjbFmx
 OGjBaVw8equs0hp66X87CYSyRPJuxcMT/kI+UNMzgabBJTMvLYU86M7vADyE0DTJPyEc39BCZ4E
 d9Ze0rrFWxEBr1b1mhL74vDegjP7T+uFdx/8C8m2iQ4FPJ1os657AsAI69+hdEyCytw3EUhj2dm
 vqdUFUeFyL8ENTzfq0wTKJOTPn9WrKXoL3gf4EjwBCfM88H+d6YeNMSx1uBeWDnfTbByIs+P/dH
 o6DCMFGQ7UW2pN+ndON1eRAl4E/eDcYAiWnxfqByEAIqSZhkE7FhVx9Y0ugC+ZePaP9x537cWoR
 p1wyh2ksImLwGHmiF1rUE8dc/z0CyXpkCa1S2ZSIeP7YEh4NxnS2LgUXlWYpQTGLeRE/KNXoh71
 tjMYidLq+4iOENvpNjUSRll3bfq6Ak4HYvSC9AV2f2r5nCg3cXlguxv5BqFjwiuHQ4r0Tg7ytuY
 oXtJgYbHE9yN3diK19g==
X-Proofpoint-ORIG-GUID: mkSiAPpLaLXm3H41wM_yozL4oDttydmK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAzOSBTYWx0ZWRfX4PrJKC9Nw052
 nGFBB0pQBDlnh5NSx4Ve3u+tJ3aqofYhVjjNAa1hwbMK2TOX4z7UgrQv/agRJB19Rog7IPUwnP8
 GEvG4plmtazqdqGlfs/dVnsf7c7myGI=
X-Proofpoint-Spam-Reason: safe

On Thu, Nov 05, 2026 at 06:24:48PM +0100, Arnd Bergmann wrote:
> On Thu, Nov 5, 2026, at 18:12, Dmitry Torokhov wrote:
> > On Thu, Nov 05, 2026 at 02:43:17PM +0100, Arnd Bergmann wrote:
> >> 
> >> As far as I understand the situation, wm831x was used on the
> >> reference board (Samsung smdk6410, removed in 2019) in addition
> >> to crag6410 but never anywhere else upstream. The question
> >> then is whether we'll ever see a DT conversion of crag6410.
> >> This would require finding someone willing to actually do
> >> the work, and coming up with a way to handle the autodetection
> >> in mach-crag6410-module.c so the correct spi/i2c codec
> >> child devices are probed.
> >
> > So I guess the question then: do we need to keep this board at all? Or
> > it is time for it to go the way of the dodo? And then we could drop some
> > more drivers as well.
> >
> > My goal for the series was to move along legacy gpio API conversions, as
> > well as move away from the GPIO lookup tables (ideally I want them gone
> > now that we have software nodes supporting describing GPIOs).
> 
> Mark Brown is using the board for testing eight Cirrus/Wolfson
> audio codecs:
> 
>  - arizona and wm8994 have actual users with DT, but this is
>    the board he has for testing with platform_data

Yeah both of these series of parts sold into a lot of systems.

>  - wm0010, wm1250-ev1, wm5100, wm8996 and wm9081 have no other
>    upstream users besides this board and no DT support, so arguably
>    these are probably obsolete and could also be removed.

Personally, I am not super fussed about testing for any of these
parts most of them didn't sell loads and they are quite old.

> I assume Charles can comment on how important the testing still
> is for the codec above, or if there is other hardware that could
> be used for testing the arizona and wm8994 drivers in case the
> other ones are in fact as obsolete as they appear.

Without wanting to put words into Mark's mouth (please do shout
at me if I am off course here), I assume his use of Cragganmore
is less about testing specific parts and more about it being a
very flexible complex audio system with good debug, allowing
testing parts of the core frameworks that would be hard to hit
with off the shelf hardware.

Thanks,
Charles
