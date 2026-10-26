Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793009737;
	b=Uwk9MiwDl5mxENtr5HQeaW1DViEB+6JJI96f9APNeHCmpsfW/YzaHOk+oZNm/cPsQ8Xb
	 ipD1H/au9eSsNsiVVOwJPt17lQ0haA1BKy0LYyUQBxvhlMLOwpQwxAKNUD9faDkYhwgwj
	 tfS0OR3i3sfA0x0FiZIix5io9wGq0qOXboGYj6KtxMTtcB3qfCbKGFzNVA7NP9UFsQVPV
	 paSa/7c29bfrCwwszt2GIXg95j+XlvwHjpzuZmDA7gBq0SQa2ERSJF0/U4cpLgsa7hCdP
	 MbBx6ODHcMVGut9pUmgD8Z3Mfo1valktJOUkZjAffGIXjGFGUNmWA0mnDjpmDOYxGeg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793009737;
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
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Reason;
	bh=vwm1kNv2QlyU6ltlxEkW8D/FhpLyU7xouyiPkxyl0mk=;
	b=pjQBmWPOSFaUxY/VZsIOAsTfqTa9NSpFgC/jDgzhk9226MOsJSxGGAGnqp+gZyeQnAhu
	 Xhbnih/SatNv3v0qq1KPSwDOxWZSa6qpEuhV2eZyro7uQPLnl3qCCIGvso61bUFkUd0rt
	 f9TZCPIFBR8Xb9P4hYu1HJkW4RwhGdbcBZxMMjnppRWevCbN7JCEsMy8wC82bnK5YkkVC
	 DkyJT8d74NUTacbM8E8wfS1BLqWfcFT7Bnfle/6ifauTFE/4G5KoqM9w4f6hbEKSGiI1B
	 4GG75zJlPbGR8U1QQP9FXss67gfaKGbpNVGEIxXcv/9+uXiaeQGawymV+MttzdY2fAw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=aDtkMkz9;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=l8hYJuAI;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB86360A2600;
	Mon, 26 Oct 2026 10:15:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB86360A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=aDtkMkz9;
	dkim=pass (1024-bit key, unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=l8hYJuAI
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4eiG11630592;
	Mon, 26 Oct 2026 05:15:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=vwm1kNv2QlyU6ltlxE
	kW8D/FhpLyU7xouyiPkxyl0mk=; b=aDtkMkz91/RX2QuAE/nahgRLHLhKWqKqP9
	u9qbyphx8kabfEcyoOA7Dxaw696opQuhj0MT+pFfsOoDNpSxG+ariFTkDR2MpqLD
	jnnehfSLv+jCFuhdfhCxic53GRJpOUqL4tQwoFV3UnO2MGTLfgfV3dE1AS0B/AEk
	q50RpF7+WypR1YfP3LB5JYbsIJ2HuaVm1W2quvKZAUwjyHvLX3/8T54GUagmxFZ9
	a/1UgXcOHatfx6c8DbnUt1kAj3vHuD+0jq7Yw+SlHTf8E8qP2CYI+ctl+7hTMTrw
	R9c3QwJRuZa4CIAR02ZRDn7k3nzUt59b2tnIN7xF8w9hJGjknWpQ==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11020098.outbound.protection.outlook.com [52.101.46.98])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4hgs3j9x29-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 26 Oct 2026 05:15:16 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ERwQvvBquod9Q9m8OaOBf8gWsih8zppKXWEveUE7JjgSCovwUmoRrg0OOim/Bze9obtvhWI/W09TZtUcl3CoRzwxZCx9yNNO5zmN6UsyLPVJy4S9Opr0Ve+lLiSOMIFwotc7AIeZU6QOAfdxSXsMbX4LASFXjTWbuHax4reDwJvdQ6xR1JlVPFLc2vKjxHthWaxhxzL2WXHHFH8pbJTM4U7TSliDaRxuwuOlBH2qw+bIr9rDGfDS1W1zl9pPqLjHwDFIok2GJz50b3Pd5LHUMIGZBw9k+MKVBCDvQqaLeit9aEjWjZuZNJkEHDUu+ksCaSk9fSZ0WLyFe5vbueMzEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vwm1kNv2QlyU6ltlxEkW8D/FhpLyU7xouyiPkxyl0mk=;
 b=AibwL7NqyFfRF/gsBsi4YjRQKcmJNOED89ftACWY8go6V7hnfHJW0Glpx/j52UT1aCQ5NmuuIFpwdNYMyF3Ylkebs1xTd//meGSuoDS9WOjPqiwiq8W/ym6KhrGYTbkzondKb35xwk/T4R/GQlncp1ffR8jHf39BtxQaYAFxJukSx92JtyMFPW8r5BPFz6mkeJkB73/9QXFidd5BwTVj82SHoVTgk/p6ACQaOWs/FkJ5Kc1NUsb2jPf+xKV735MByyHgt0+wNSXewBdUKaL8UUyhC5Niy6A3hG0wmE89pDLEX7cpIvyfKc0dnc4+b6NeQknFFvrMCOokHT0oPrzyIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=armlinux.org.uk
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vwm1kNv2QlyU6ltlxEkW8D/FhpLyU7xouyiPkxyl0mk=;
 b=l8hYJuAI7OCXlJMcvWWbHi6OxSZl+JiK8KplEtF/bIju3NvPAIu6a4dOzpwxjNkcNyr3OlVP3iNXFOf120e8D2hIzVjulUyKPA1TRCPdZMTuhwpipMVlAm0F4m6Bd/mJSRdfqjBR1UMtr+Byhij6+Rx9cEl5vZ9YKslhWc15uBc=
Received: from CYXPR02CA0016.namprd02.prod.outlook.com (2603:10b6:930:cf::19)
 by CHBPR19MB901682.namprd19.prod.outlook.com (2603:10b6:610:402::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 10:15:11 +0000
Received: from PH3PEPF00059616.namprd05.prod.outlook.com
 (2603:10b6:930:cf:cafe::a6) by CYXPR02CA0016.outlook.office365.com
 (2603:10b6:930:cf::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.22 via Frontend Transport; Mon,
 26 Oct 2026 10:15:11 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 PH3PEPF00059616.mail.protection.outlook.com (10.167.243.20) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.4
 via Frontend Transport; Mon, 26 Oct 2026 10:15:10 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id C9F2E406540;
	Mon, 26 Oct 2026 10:15:08 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id A5875822556;
	Mon, 26 Oct 2026 10:15:08 +0000 (UTC)
Date: Mon, 26 Oct 2026 10:15:07 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Russell King <linux@armlinux.org.uk>, Mark Brown <broonie@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
        Arnd Bergmann <arnd@arndb.de>, mfd@lists.linux.dev,
        linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, patches@opensource.cirrus.com,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/4] mfd: wm831x: Support software nodes for DCDC
 regulators
Message-ID: <at8oK+BLf2FQjp9U@opensource.cirrus.com>
References: <20261024-samsung-kp-v4-0-e21253295e68@gmail.com>
 <20261024-samsung-kp-v4-1-e21253295e68@gmail.com>
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
In-Reply-To: <20261024-samsung-kp-v4-1-e21253295e68@gmail.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH3PEPF00059616:EE_|CHBPR19MB901682:EE_
X-MS-Office365-Filtering-Correlation-Id: 992fd0d2-f5e1-451a-49d9-08df334a0456
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|7416014|61400799027|36860700016|82310400026|11063799006|4143699003|56012099006|261022105027099003|10067099003|16102099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	aOjtDQTeCvtTAUjBNqjmDS+mjgZ62fyLC8zsIA367DX49kcWsA/fzjohWlLbo3c8zO5gekrNp1PDgAdJasSu2sohgpO/OPX0R0qrhRvFacyYgh/kioBbnrzILdX19SYzKUPoyIR4dgYbmx7Kui5CV3AW+tIxozji0qHSHF6CEdV0UeMPiZ2LjRM111w+Vx+x4okWzh8Eoc6imUnG5Xon4Y7pEiqbgwU1Ot5b2IBxv+FeKwkefhm7Ikl+zUnKYQElk2Vc1WDVJpudA5d/etJkbxmge7jE6uwGysUBROui3nKrgq7X4LdEfTbZY3bkPqv2wm5V7Hhfqh/n1xNFQjoIDjPUP/4agoEq4C71BB8EG1ivb6c3+PoIihZgs8XbKLF+UZniU/rOewNTlgIfsp76HotgEJ0hNus52AK58PZ/Q7vltfAMU5es7/zWknwmE5Gw/Lt5zEltKy6efUo03j007XHwYtlcSTxJInULJZDckvv5UGp06iGNPX5Nv/alCV1pl7iYE10IgvTpkxiIDT2MX+X4c9cue0v6QHAMf5XGF/UNKChO+E0xO6G6UpkGweeW8fhrI55/hv1iH43w1YmU6nggKAxcj8RcRECVmmQvA3JxeXAWwT8ny6ihRvhHMqley4qJ88VZ/ExNo+TcXvzQsYjCeYYMFXrmoWzIlBU6HixjL9alucDVAtCGr7YX2K+8V/AonuGpi+r8ebXWjqO8Lw==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(61400799027)(36860700016)(82310400026)(11063799006)(4143699003)(56012099006)(261022105027099003)(10067099003)(16102099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	kiisTVRUknwwbMFVx3MjldOVJDjKvpJUfEkV2G+lwWCHvGrPPuMMhvsTK2h4ZRDVHqHa77FjhMIfBdcisll9Zhz+r1QLzYvTbDJevEegmNAg6GOlArwjNq3Eiz0+GtOTHvYJSbjccxX0k7CNSrA3nSkc3UESgHTw+8ZCqqRj437NHxG0+fy/RZVsZlh5CskNCQOEb0ev0xNfm6xrGqs6+HxVGz06ScWmIJI7MQmXoELc3+OBw6Qw9ke0AwfIeoEtqIDhW6Jn98Jb0TvHIH85W0CQNDgJhEI11x0oeYgN/GXOXjUP98A25APxvY52p5KR7x4a9ofgq73m6SRYwCodxinFhcEHcHUTuqskO2NfdwKwjoV0fJHFKh/Tnw8Ll7ZicPp96uByUoN3fgH1dqnDpDw4qn+q8+1Aq+ztOsH90AD6kSmDjGSDnh6dHWY9Dk3A
X-Exchange-RoutingPolicyChecked:
	2BIRLxo7xqoJJOhvoIdgkdQDxbSjB9fP7R+q00M7Rl0PF/jPOmvOeLRc7bM8T1lr8CDYn6e4zs7/OhdPevsCdzbCCEtiZ4uvUqE6pHi6zGmhBDnQ3bQlpCkQljs65KaFG8IJmSe2av79x1FG3KtTK55TxRRCVkZPmv0LgFGU5T0eDaEeZQdh3q/dUCRZKWEgxgLtVBcdAzcLwPzf5aELwmUqb6iJNBqZwnEZOTnqMrhHnQBfcFBWN+GEFRsg6pmStou3jyMoubo6vbEF7I+soyJ0eQiaQ3pp97ZCJFB4/kaQWe8135v5clWn7tPMcK7sp9n2V7+epI1T9/1Aglah5Q==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 10:15:10.0191
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 992fd0d2-f5e1-451a-49d9-08df334a0456
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-PH3PEPF00059616.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CHBPR19MB901682
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0MCBTYWx0ZWRfX2XPaMbkOeeZH
 dLP2xB114ODBD6DpL8Me8zP/WXuiq1zPyJ1GE+tcmnojaYUgV+z9vW7IdW0Dp1Xnhm7ntx+ba4G
 yaTwW5LGXlGHER3cdACH0UD2pN+wOHk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0MCBTYWx0ZWRfX5+UToS1f422v
 8xj1UbxgW5YS5U9lK3/HQLP/ABJyuwFwZpH9wBUALCmOMsrZYn/cN32tNF4CkDuTYEoWYhaYgvV
 Ifi65SFWVVWcC7Eb65hh4FcLTA2KRxQwuCHmRU965GUIF8CEFTi77UEibOgPkmnRmmxyAkE4aI2
 N+kziiVQlNMJhQu2OfNKbx5h+qQBoW2w5ntMQTbC8r0RyCpmgZoLJYiiQNmIXnTFn3FE/axr34V
 /QggxKAqCkahUSXNGj1oMDw/XH6LpUJR2LRLVFrwmSQ/Gc3Gb+5TssqI5x2HGZ0/KCEsnAFh9nt
 VXssZqrS90UsRa2rBxEt7E2CODwItPPCYnx0CU/L5e/StfR9FBaSABTZlJoch2vkdbvXLrpkAGd
 Rpa7WMhGGv7SO4Jj4RwfRIDTm1rR1ZAD30LzkPdGIr0MGIutLAhK3sgPsuSoh0KOBCzPWEs9Ln9
 n93vA6Q+7C3gxq+Wn+Q==
X-Authority-Analysis: v=2.4 cv=dbIVTnXe c=1 sm=1 tr=0 ts=6adf2834 cx=c_pps
 a=jzpQLMhUvwWo5cn4Ul+sFQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=pGLkceISAAAA:8 a=w1d2syhTAAAA:8 a=jZ_tYwO_ofv8OuE6UmYA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: AEtsWP36Ds2MGtlBxuE2kRlqiDjPXeJf
X-Proofpoint-ORIG-GUID: AEtsWP36Ds2MGtlBxuE2kRlqiDjPXeJf
X-Proofpoint-Spam-Reason: safe

On Sat, Oct 24, 2026 at 10:03:12PM -0700, Dmitry Torokhov wrote:
> Allow passing software nodes to wm831x DCDC regulators via PMIC platform
> data. This is useful for non-DT/non-ACPI platforms that want to
> associate device properties (like DVS GPIOs) with the regulator devices
> using software nodes.
> 
> Add software node pointers to the PMIC platform data and have the MFD
> core assign them to the buckv cells.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
