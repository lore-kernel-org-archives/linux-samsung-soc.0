Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C26AD23026F
	for <linux-samsung-soc@vger.kernel.org>; Wed,  2 Apr 2025 04:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743566804; cv=none; b=RE3qw73y8t3wUtvQ0bDyrc1QGtRyEy1F0KtenQ1LvT7meTLVDeOQAYbIJL1ZJBELaDBdof0pxgfq9YeH9zWBSTzN04A/L2iZnyQ1ybiEi+mYb3p58DO3SNQY1zURk3GqOcwrR44eVKztDDoRacONYObNzGFemrUZSA3zi1pgn4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743566804; c=relaxed/simple;
	bh=aL6DouibxZ3mmvzMFAI5B2EStULtyYrGU+H+MPVm55Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:In-Reply-To:
	 Content-Type:References; b=tLMjLN6he4G8pSpd2XMafcHt90AKSosO6zMxIEWbDF2EX5fMPKEsti4gTB0fhE/pgcQcRfFdlKszO9UY+Uro5FG6JwJ3gZeejHBCn36ghoS/TNFOMS4NF6y+5j0dTYySVrnZtSNujdLN3u/lhq7d3J64GgrPW+57sXwJSmfYJYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=apCZjUF8; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="apCZjUF8"
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250402040639epoutp03dd25e8db946698e3b4a90f8d5ec2ea4c~yZMQ0lhUO2704427044epoutp03-
	for <linux-samsung-soc@vger.kernel.org>; Wed,  2 Apr 2025 04:06:39 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250402040639epoutp03dd25e8db946698e3b4a90f8d5ec2ea4c~yZMQ0lhUO2704427044epoutp03-
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1743566799;
	bh=YaSBtJTzWwLtALPXgANET9zJimuDj0lthSCemMiv7pU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=apCZjUF8xhhdvKd8NB9f0zqX7LfL5xBTmUUulEWlb+fzVXWEKHSxhebYlxcl6sV75
	 y5T3mw3sV20DwA5KyTFNEoUnYHZgD7VTsjL1TQXd6nZ0cPgyi3L3CUGtSDQeopz75Y
	 gEq9FacBxZPTduhgZWRPG2z7L7AKlZVvnUNngbdk=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPS id
	20250402040638epcas2p28056a7638c65f03f27448e5b5a6c20a3~yZMQJvFAz2037220372epcas2p2w;
	Wed,  2 Apr 2025 04:06:38 +0000 (GMT)
Received: from epsmges2p1.samsung.com (unknown [182.195.36.92]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4ZSBBk1mGNz2SSKd; Wed,  2 Apr
	2025 04:06:38 +0000 (GMT)
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
	epsmges2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
	13.8A.09787.EC7BCE76; Wed,  2 Apr 2025 13:06:38 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
	20250402040637epcas2p155f746289534646acd447e6615820f96~yZMPLKO292618426184epcas2p1K;
	Wed,  2 Apr 2025 04:06:37 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250402040637epsmtrp11998c655ca28d45573c740ac5a3f5bcc~yZMPKKLoc0152701527epsmtrp1N;
	Wed,  2 Apr 2025 04:06:37 +0000 (GMT)
X-AuditID: b6c32a45-9d3ff7000000263b-16-67ecb7ce9675
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	3E.7F.08805.DC7BCE76; Wed,  2 Apr 2025 13:06:37 +0900 (KST)
Received: from perf (unknown [10.229.95.91]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250402040637epsmtip1a34f85905b1205aca88825950159722c~yZMO756km1079510795epsmtip1k;
	Wed,  2 Apr 2025 04:06:37 +0000 (GMT)
Date: Wed, 2 Apr 2025 13:10:55 +0900
From: Youngmin Nam <youngmin.nam@samsung.com>
To: Will McVicker <willmcvicker@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
	<will@kernel.org>, Peter Griffin <peter.griffin@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>, Tudor Ambarus
	<tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
	Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Alim
	Akhtar <alim.akhtar@samsung.com>, Daniel Lezcano
	<daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Saravana
	Kannan <saravanak@google.com>, Will McVicker <willmcvicker@google.com>,
	kernel-team@android.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org, Will Deacon <willdeacon@google.com>
Subject: Re: [PATCH v1 4/6] arm64: dts: exynos: gs101: Add
 'local-timer-stop' to cpuidle nodes
Message-ID: <Z+y4zxfifkQqLxKF@perf>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250331230034.806124-5-willmcvicker@google.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA02TbUxTVxjHPX25vaCMa2HspIpjV8WBAi2j5UKAEWWkui3pdIvOD+INvWkJ
	pa297SZm2RCRtxiGuEWtDlHGXpqC2LJLEWSuOtgGq2EMZAgyNzS8SbEwF2DAWm63+O33PM/5
	n+f8n3MOyhX2IyI0R2ukDFpSgyOBPOZWlCzG1TylEruqAonfqxmEaJqw8wj3F6cAYb3h4hDV
	s+HEpdsuPuFoDiXGzfcRwvZnP5/ovX4RIc7daecQjeeWecRKm0NAlDuXEMJu+5RLeAYPEUVD
	UqJkfpJHWDwrID1EzrQyfLm12grkNTaT3GYpQ+RD/W2IfNrlEsjtn38kr2iyAPmsbZMi4GBu
	ipoilZQhgtJm65Q5WlUq/vq+rF1ZUplYEiNJIhLxCC2ZR6XiGW8oYjJzNF5DeMR7pMbkTSlI
	msbj0lIMOpORilDraGMqTumVGn2iPpYm82iTVhWrpYzJErE4XupdeDhXfWfFiei/Ex5t/3kS
	FIDPgstBAAqxBOi5WiooB4GoEHMA2D1UDNjAA6CbmfdXngJobxn1Buiq5GnXO2z+BoBFvdN8
	NngA4BVP5eoiHrYFzl3b5muBYDGQ+WEZ+DgU2w7H2hpXN+Vi43x43DtgXyEEOwx72if4Pg7C
	NsML9cscltfDH8+P8nwcgKXBs301XJ8YYqMoHFq8yWNNZED7QgOH5RA40dkkYFkExz8u9jMN
	C0YG/eIiAH+6O8ZlC69A86OS1eNxMTWsbOhGWJub4e1BHpt+DpbeWvK7D4KlxUJWGQkXPmkE
	LG+ErbVf+XeUw29WGIQdyvcAdjJVnEqwyfyMH/Mz3VjeAWtaPV5GvbwBfrmMshgFr16PqwF8
	Cwij9HSeiqLj9ZL/bzhbl2cDqw88+jUHOPN4JtYJOChwAohy8dCgA3+Nq4RBSjL/GGXQZRlM
	Gop2Aqn3ck5zRc9n67w/RGvMkiQkiRNkMklivFSciL8Q5HzyUCXEVKSRyqUoPWX4T8dBA0QF
	nMjjR81fd7/f4R4Y7nZEzw5bI7dF7T1xpWLq8eARNDypqU4A12U/7D3pVj76Y89NmeuJw1I1
	tfOX5q5DJy4Iova+lZh5LGxa0DxfgL17pDNYGr52fdnMYtc9S0vDhyOCPOXOArwjax/v8nDK
	5KWa+hddqbmi1IyBkw2h+cwMDCtVJAc0Pug5GNeVX5vcXhepf9X4rXBD6PxLzMuDhSUe5u7i
	1jOnaXd64dzGrtpTb26xrqwtj005UEbiv6b31I3J7sW7387cYW3JLFxTLFoz3dHNGR+RXJtb
	d3+OOruoQAfqtX0Tu3efl20vWaL6Pgg0ByN/70/b88/CRVPLbxXUfmpr2WWcR6tJSTTXQJP/
	AiUla01pBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprFIsWRmVeSWpSXmKPExsWy7bCSnO7Z7W/SDbrf6Vg8mLeNzWLLq80s
	Fu+X9TBarNl7jsli3mdZi/lHzrFa7NguYvFy1j02i02Pr7FaXN41h81ixvl9TBYbZvxjsfi/
	Zwe7Rdehv2wWmzdNZbb4dCvOouWOqUX7z9csFqs+/Wd0EPbYtnsbq8eaeWsYPRZsKvXYtKqT
	zePOtT1sHu/OnWP32Lyk3qNvyypGj8+b5AI4o7hsUlJzMstSi/TtErgyXnR2MBY0ClRsfzWR
	rYHxG08XIweHhICJxLfToV2MnBxCArsZJQ6tUwOxJQRkJG6vvMwKYQtL3G85AmRzAdXcZ5TY
	+H4RK0gvi4CKxJeN6iA1bAK6EttO/GMEsUUEtCVe7NnADlLPLPCZVeLN4kNsIAlhgQSJSx23
	mUBsXgFlidlr/zFBDD3KKNFwZyELREJQ4uTMJ2A2s4CWxI1/L5lAljELSEss/8cBEuYUsJOY
	fnUB8wRGgVlIOmYh6ZiF0LGAkXkVo2RqQXFuem6xYYFRXmq5XnFibnFpXrpecn7uJkZw9Glp
	7WDcs+qD3iFGJg7GQ4wSHMxKIrwRX1+mC/GmJFZWpRblxxeV5qQWH2KU5mBREuf99ro3RUgg
	PbEkNTs1tSC1CCbLxMEp1cDEnexy9Vj/lH+y0qUNPxacEIvUOLB3sTTb09S6O6Wn03/EaGnL
	2k5a+FRRy7xcTjx6UmJKQkbodNPkPwV1WfcPTV+7z/Lm/+AXjmFP4qqEM+8Zvm8JeR2T5iJx
	t9381KdaWVYJ9bcyM3n3hJ7407jw88MLzNzPgzrvi/KtWCO73jVdpPjlrjl+q37J9B3+nCrZ
	4XkqVV3xWtJvq0mPPURX8EfyzFyi0FC2p92v3OjEwxNnPl7Tez7xiNANllI7GcuGMItzLtMX
	3nQO379ectPly4G3GZ+GrjnaEHpKrXfngyVVby61q/V9Odzpnq5cqVaQG1F0i7XYfNe21AVT
	n7R9na2zJlWidk7uIy3PyAolluKMREMt5qLiRADGWvwELQMAAA==
X-CMS-MailID: 20250402040637epcas2p155f746289534646acd447e6615820f96
X-Msg-Generator: CA
Content-Type: multipart/mixed;
	boundary="----caUwc_dC5aEw_I.xGS0GMYyTEPKysFRHRKa1IoFNAgiy-i3F=_74ef6_"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250331230151epcas2p486a7c6d7153737f4168cfef74249742f
References: <20250331230034.806124-1-willmcvicker@google.com>
	<CGME20250331230151epcas2p486a7c6d7153737f4168cfef74249742f@epcas2p4.samsung.com>
	<20250331230034.806124-5-willmcvicker@google.com>

------caUwc_dC5aEw_I.xGS0GMYyTEPKysFRHRKa1IoFNAgiy-i3F=_74ef6_
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Mar 31, 2025 at 04:00:26PM -0700, Will McVicker wrote:
> From: Will Deacon <willdeacon@google.com>
> 
> In preparation for switching to the architected timer as the primary
> clockevents device, mark the cpuidle nodes with the 'local-timer-stop'
> property to indicate that an alternative clockevents device must be
> used for waking up from the "c2" idle state.
> 
> Signed-off-by: Will Deacon <willdeacon@google.com>
> [Original commit from https://android.googlesource.com/kernel/gs/+/a896fd98638047989513d05556faebd28a62b27c]
> Signed-off-by: Will McVicker <willmcvicker@google.com>
> ---
>  arch/arm64/boot/dts/exynos/google/gs101.dtsi | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> index 3de3a758f113..fd0badf24e6f 100644
> --- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> +++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> @@ -155,6 +155,7 @@ ananke_cpu_sleep: cpu-ananke-sleep {
>  				idle-state-name = "c2";
>  				compatible = "arm,idle-state";
>  				arm,psci-suspend-param = <0x0010000>;
> +				local-timer-stop;
>  				entry-latency-us = <70>;
>  				exit-latency-us = <160>;
>  				min-residency-us = <2000>;
> @@ -164,6 +165,7 @@ enyo_cpu_sleep: cpu-enyo-sleep {
>  				idle-state-name = "c2";
>  				compatible = "arm,idle-state";
>  				arm,psci-suspend-param = <0x0010000>;
> +				local-timer-stop;
>  				entry-latency-us = <150>;
>  				exit-latency-us = <190>;
>  				min-residency-us = <2500>;
> @@ -173,6 +175,7 @@ hera_cpu_sleep: cpu-hera-sleep {
>  				idle-state-name = "c2";
>  				compatible = "arm,idle-state";
>  				arm,psci-suspend-param = <0x0010000>;
> +				local-timer-stop;
>  				entry-latency-us = <235>;
>  				exit-latency-us = <220>;
>  				min-residency-us = <3500>;
> -- 
> 2.49.0.472.ge94155a9ec-goog
> 
Hi Will.

Are you using this property in production?
If so, have you noticed any performance improvements?

Thanks.
Youngmin

------caUwc_dC5aEw_I.xGS0GMYyTEPKysFRHRKa1IoFNAgiy-i3F=_74ef6_
Content-Type: text/plain; charset="utf-8"


------caUwc_dC5aEw_I.xGS0GMYyTEPKysFRHRKa1IoFNAgiy-i3F=_74ef6_--
