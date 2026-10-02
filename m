Received: from mail-vs2-f36.google.com (mail-vs2-f36.google.com [74.125.227.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A2E54BD35C
	for <linux-samsung-soc@vger.kernel.org>; Fri,  2 Oct 2026 14:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790952056; cv=pass; b=uY7XK01RP642Hz5fM3tCGZb98W5hfo5q7kggasBitIsF+glr2/qduY0xaw98eF5I3D+YBufigB6gJNbttqpiP3O1CPQDTe8eUs/Eu0gNm470j0kjzb0rTRlqSo7DHEwfPC0N+pAgEX7+rnur+fzUdYam/1YWIHsxOnXhRuYar5w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790952056; c=relaxed/simple;
	bh=yThCC7PHEtVrekbHIcRKtJ+4ThQy3inWeHk3llKz7M4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HlovsNUKSt6FKTOo8uPUbAdTy0/qy4u7v1AgLZmA55owW6TC8AtK8JBeaef9FP91knFUpfpLHP4ZDxxakRjJHnxY8MRdsJw5DLSPToj4O8rN5TVkLgrXcum7BsKi3/oTGa4vG73zx++Te0MYrM5Ng8Cl+N9pcQLICptdfIxITDs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sHPmXUXP; arc=pass smtp.client-ip=74.125.227.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sHPmXUXP"
Received: by mail-vs2-f36.google.com with SMTP id ada2fe7eead31-7bb9fe18227so2136979137.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 02 Oct 2026 07:40:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790952048; cv=none;
        d=google.com; s=arc-20260327;
        b=QJZSLNOe5+pbGrNz9RAb5FRouTJrD4ETGc3ExjHAYwn0xoe/RaAKAa00YWi37SeiDh
         wePFEKzQJ76nV0+I9tPi/v4DKRUeNtdTtHMIWtf+Nos+MmyMBERyl3x7Lt8ZS9EEGtHj
         pcbDtkrToPswnq3SskT/lBaR9DrhWAn7UOCMZwAb3ut0gd0lApxTzT7s6MHyEglAk5XC
         6jGATFyafyY84RKc/rW1ltWA5SM47be5Rz+z/CqNkE3A2YdSL1iuwYrlqbPvGbE4yU3E
         iwuQdZxVJA5+HbE9c2lBLuKYVrvgRTT4o1HuFsmB2s3P8vnnxS+PYhH+hUiDZ0sSDM9t
         uWbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=4N4a9WNMcn4c5RNG0HhOqhbbIcBeca2e/1494h5sAxQ=;
        fh=ddy1N8eiqeAbhBErIgKyZ7P6vtEJS6Oo+L3uEw8pfDA=;
        b=Dtc35jvDJjPslmODX+Dn/kEOefvezvhq4ZjtoBlOdlQHfRsT0Ag3Zl/4IWuTzViLhk
         CUYELD4IxWOjmnBeyPN3qZJxzo2L7ASUsMzYkacxQF5vm4dUWEzQDADG8i8z/2vf79XL
         Qxre6MtdXmhdi65ysIqk79kRBiz37ZF1wfgUoq2gHzEF1OqdvVrKzqG2P6AcaAUp688f
         LO9Akuzg8ItimeptLYeGAy+PjQk50kfw+Pp4vrLvohALjGBEQqhtyAc09Qw2NdSXfpuk
         FrftbvkaOyT1XU3GbSMv+BmwhcQYB4YTm1phJdNIfQZUtP2QndW90w7ed5j4GPkj4rv9
         CjHQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790952048; x=1791556848; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4N4a9WNMcn4c5RNG0HhOqhbbIcBeca2e/1494h5sAxQ=;
        b=sHPmXUXPHIaj4Ir2ypLxJIs89CzNrMaVK+Z9qVO/U+tUtAXBmX5r99af9qgmMsbJ9Z
         RtPHbvLmn4PcTW79yDcqw+KjgLIxFknWOKc4aDIhXCSwNFXEmhyOPkSjo3DUM03FtNtE
         YbtcU0MvNKVG9Bo+z4WXgeBD15hyDFXDiFKwq9eYEx/cqNwMuQuQBWFryhMASRJARVcY
         E4nvTnMZJdknQdYGcmzJ3woVX0Jj/89cPuL9jZzXGc0nHTVEXPnEQxBPleakS5SN8w9m
         +y3x0zwVfZ/E4ZOsMKBQ5zgdDiTrlGTBa6f/09xK0VXwhN2zmftqs1Y2eYpBBIwKVzla
         L+Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790952048; x=1791556848;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4N4a9WNMcn4c5RNG0HhOqhbbIcBeca2e/1494h5sAxQ=;
        b=a5IJgRSmuoi+NHzTbp+0mtUvK3vQR5W2VNJVJJCYOP63mFh6EogBkFC+uvqR59O8v4
         yv3rmQcdkzav3xKrZ6TjR0pGgNHpqowxGSa16O0jPyKkEXC74DFDuurbFMeb6JImx0mf
         x6VtweTHLRnIJJ/EdPGZq+2nDaTL8srsoIjfLNMnuWSTHRkJvKJKD/Xmzkg4eX2LwfRf
         mdzfl4wRPgPnZ9G0bFM/d0AkhGrEAejwEazy6N+QjFajXexfgVDYa9FRPiz4JO37IxJY
         FtOIMldJpLz5IvHRoIXGRBI1y0QeoOPOLZK2GBOmnAInyRsPoYMKNd4qpLsraysTEXNq
         /JeQ==
X-Forwarded-Encrypted: i=1; AKwUvBzlsxN4rab1QGS24r+Ior+tDersMBChWUkcWlGwaQMRUUPIb0CfhodTIuYlp1rRccRAM2BgIzoOReIQ1CioKebeLw==@vger.kernel.org
X-Gm-Message-State: AFq9FYIDX/13p9RovMwQPg1HC6v6SsMNMOe6XukGlc7CWrAa/uEAiOAN
	98eIUEMunR1O+ilf/aQyQy3YpKP0wAzlgKajbMdbWgay3NIARCrs+zz47qArCzYYXr52QQYhCqc
	TmIlrUVDqGndt7uDhtowisPRC+DBUbPJGgb01smwQJw==
X-Gm-Gg: AYBFou0We7wquypkK/VFClWC+vAGGGxTePjktPfJ/WWfOUPYgU0EWwkrnNQzm1XL63F
	z1Ktqq1qi4h0BoEc3Nj2cbhD1fZ+dgHtqGJFOBW3tMVXUtKTRin+ag54nOpDigeY+DaUzvRoC3P
	U4sN0xItw/ff6KXQUnodzYTtZzplCxm1YSV8m0TP1x2q/sRo/aFqFYjhhYiZhsn6RbW2V6ySRzA
	EEs0D7XPkES4ebarMpjpzi8UZcuFqAIZAfDqb4dcwXSU4WH4ZU3PNkGo4J1AXVvRUaAbtjA0HBq
	shXlSgLVnDPzUcPbcan41qlkjvnBTJ9463r8rxNxdIRRPsPjYY/pKwKAcTvB8fPSzk1EZl9Htcj
	oPIT/K3c+5F74vw==
X-Received: by 2002:a05:6102:1624:b0:7a8:10eb:9775 with SMTP id
 ada2fe7eead31-7c0f1de9f8amr776221137.4.1790952048089; Fri, 02 Oct 2026
 07:40:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929-exynos850-acpm-node-cpufreq-v1-0-5a86c1d404b8@linaro.org>
 <20260929-exynos850-acpm-node-cpufreq-v1-2-5a86c1d404b8@linaro.org>
In-Reply-To: <20260929-exynos850-acpm-node-cpufreq-v1-2-5a86c1d404b8@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 2 Oct 2026 15:40:33 +0100
X-Gm-Features: AclHuK8D6xaEDYaJjeS22_XFdGHe8Vl0E2LtBv0KYmeFPY7diuDQNpJU8hTUVF8
Message-ID: <CADrjBPrTNGN7N9Q+rRO61O-mkz-j7YVV4D3tT0W=xj=KM-GT7g@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: exynos850: Add operating points for CPUs
 and enable cpufreq
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Sam Protsenko <semen.protsenko@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Thomas Turner <tturner@lineageos.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 29 Sept 2026 at 04:11, Alexey Klimov <alexey.klimov@linaro.org> wrote:
>
> Exynos850 has two clusters with four Cortex-A55 cores each. The OPPs are
> identical for both clusters.
> Add OPPs for both clusters and replace cpu clocks with ACPM
> EXYNOS850_CLK_ACPM_DVFS_CPUCL{0,1} clocks.
>
> The maximum nominal frequency should be 2.002 Ghz but at this point the
> following OPP is not added here:
>
>         opp-2002000000 {
>                 opp-hz = /bits/ 64 <2002000000>;
>                 opp-microvolt = <1050000>;
>                 clock-latency-ns = <500000>;
>         };
>
> due to stability issues. Testing on a fully loaded system with CPU-bound
> tasks triggers data aborts and illegal instruction errors at 2.002 GHz
> after 1-2 hours of such stress testing.
> Running the same workload overnight on a CPUs fixed at previous OPP didn't
> lead to any issues so opp-1846000000 is currentlly the highest one as it is
> considered safe.
>
> Higher OPPs can be re-evaluated once thermal support is implemented.
>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  arch/arm64/boot/dts/exynos/exynos850.dtsi | 224 +++++++++++++++++++++++++++++-
>  1 file changed, 220 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/dts/exynos/exynos850.dtsi
> index 91c6cee8f483..36501e5903f8 100644
> --- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
> @@ -100,8 +100,9 @@ cpu0: cpu@0 {
>                         compatible = "arm,cortex-a55";
>                         reg = <0x0>;
>                         enable-method = "psci";
> -                       clocks = <&cmu_cpucl0 CLK_CLUSTER0_SCLK>;
> -                       clock-names = "cluster0_clk";
> +                       clocks = <&acpm_ipc EXYNOS850_CLK_ACPM_DVFS_CPUCL0>;
> +                       clock-names = "cpucl0";
> +                       operating-points-v2 = <&cpucl0_opp_table>;
>                 };
>
>                 cpu1: cpu@1 {
> @@ -109,6 +110,8 @@ cpu1: cpu@1 {
>                         compatible = "arm,cortex-a55";
>                         reg = <0x1>;
>                         enable-method = "psci";
> +                       clocks = <&acpm_ipc EXYNOS850_CLK_ACPM_DVFS_CPUCL0>;
> +                       operating-points-v2 = <&cpucl0_opp_table>;
>                 };
>
>                 cpu2: cpu@2 {
> @@ -116,6 +119,8 @@ cpu2: cpu@2 {
>                         compatible = "arm,cortex-a55";
>                         reg = <0x2>;
>                         enable-method = "psci";
> +                       clocks = <&acpm_ipc EXYNOS850_CLK_ACPM_DVFS_CPUCL0>;
> +                       operating-points-v2 = <&cpucl0_opp_table>;
>                 };
>
>                 cpu3: cpu@3 {
> @@ -123,6 +128,8 @@ cpu3: cpu@3 {
>                         compatible = "arm,cortex-a55";
>                         reg = <0x3>;
>                         enable-method = "psci";
> +                       clocks = <&acpm_ipc EXYNOS850_CLK_ACPM_DVFS_CPUCL0>;
> +                       operating-points-v2 = <&cpucl0_opp_table>;
>                 };
>
>                 cpu4: cpu@100 {
> @@ -130,8 +137,9 @@ cpu4: cpu@100 {
>                         compatible = "arm,cortex-a55";
>                         reg = <0x100>;
>                         enable-method = "psci";
> -                       clocks = <&cmu_cpucl1 CLK_CLUSTER1_SCLK>;
> -                       clock-names = "cluster1_clk";
> +                       clocks = <&acpm_ipc EXYNOS850_CLK_ACPM_DVFS_CPUCL1>;
> +                       clock-names = "cpucl1";
> +                       operating-points-v2 = <&cpucl1_opp_table>;
>                 };
>
>                 cpu5: cpu@101 {
> @@ -139,6 +147,8 @@ cpu5: cpu@101 {
>                         compatible = "arm,cortex-a55";
>                         reg = <0x101>;
>                         enable-method = "psci";
> +                       clocks = <&acpm_ipc EXYNOS850_CLK_ACPM_DVFS_CPUCL1>;
> +                       operating-points-v2 = <&cpucl1_opp_table>;
>                 };
>
>                 cpu6: cpu@102 {
> @@ -146,6 +156,8 @@ cpu6: cpu@102 {
>                         compatible = "arm,cortex-a55";
>                         reg = <0x102>;
>                         enable-method = "psci";
> +                       clocks = <&acpm_ipc EXYNOS850_CLK_ACPM_DVFS_CPUCL1>;
> +                       operating-points-v2 = <&cpucl1_opp_table>;
>                 };
>
>                 cpu7: cpu@103 {
> @@ -153,6 +165,210 @@ cpu7: cpu@103 {
>                         compatible = "arm,cortex-a55";
>                         reg = <0x103>;
>                         enable-method = "psci";
> +                       clocks = <&acpm_ipc EXYNOS850_CLK_ACPM_DVFS_CPUCL1>;
> +                       operating-points-v2 = <&cpucl1_opp_table>;
> +               };
> +       };
> +
> +       cpucl0_opp_table: opp-table-0 {
> +               compatible = "operating-points-v2";
> +               opp-shared;
> +
> +               opp-130000000 {
> +                       opp-hz = /bits/ 64 <130000000>;
> +                       opp-microvolt = <625000>;
> +                       clock-latency-ns = <500000>;
> +               };
> +
> +               opp-182000000 {
> +                       opp-hz = /bits/ 64 <182000000>;
> +                       opp-microvolt = <625000>;
> +                       clock-latency-ns = <500000>;
> +               };
> +
> +               opp-247000000 {
> +                       opp-hz = /bits/ 64 <247000000>;
> +                       opp-microvolt = <625000>;
> +                       clock-latency-ns = <500000>;
> +               };
> +
> +               opp-351000000 {
> +                       opp-hz = /bits/ 64 <351000000>;
> +                       opp-microvolt = <625000>;
> +                       clock-latency-ns = <500000>;
> +               };
> +
> +               opp-442000000 {
> +                       opp-hz = /bits/ 64 <442000000>;
> +                       opp-microvolt = <625000>;
> +                       clock-latency-ns = <500000>;
> +               };
> +
> +               opp-546000000 {
> +                       opp-hz = /bits/ 64 <546000000>;
> +                       opp-microvolt = <625000>;
> +                       clock-latency-ns = <500000>;
> +               };
> +
> +               opp-650000000 {
> +                       opp-hz = /bits/ 64 <650000000>;
> +                       opp-microvolt = <625000>;
> +                       clock-latency-ns = <500000>;
> +               };
> +
> +               opp-806000000 {
> +                       opp-hz = /bits/ 64 <806000000>;
> +                       opp-microvolt = <656250>;
> +                       clock-latency-ns = <500000>;
> +               };
> +
> +               opp-949000000 {
> +                       opp-hz = /bits/ 64 <949000000>;
> +                       opp-microvolt = <681250>;
> +                       clock-latency-ns = <500000>;
> +               };
> +
> +               opp-1053000000 {
> +                       opp-hz = /bits/ 64 <1053000000>;
> +                       opp-microvolt = <706250>;
> +                       clock-latency-ns = <500000>;
> +               };
> +
> +               opp-1157000000 {
> +                       opp-hz = /bits/ 64 <1157000000>;
> +                       opp-microvolt = <737500>;
> +                       clock-latency-ns = <500000>;
> +               };
> +
> +               opp-1300000000 {
> +                       opp-hz = /bits/ 64 <1300000000>;
> +                       opp-microvolt = <781250>;
> +                       clock-latency-ns = <500000>;
> +               };
> +
> +               opp-1456000000 {
> +                       opp-hz = /bits/ 64 <1456000000>;
> +                       opp-microvolt = <825000>;
> +                       clock-latency-ns = <500000>;
> +               };
> +
> +               opp-1586000000 {
> +                       opp-hz = /bits/ 64 <1586000000>;
> +                       opp-microvolt = <875000>;
> +                       clock-latency-ns = <500000>;
> +               };
> +
> +               opp-1742000000 {
> +                       opp-hz = /bits/ 64 <1742000000>;
> +                       opp-microvolt = <937500>;
> +                       clock-latency-ns = <500000>;
> +               };
> +
> +               opp-1846000000 {
> +                       opp-hz = /bits/ 64 <1846000000>;
> +                       opp-microvolt = <981250>;
> +                       clock-latency-ns = <500000>;
> +               };
> +       };
> +
> +       cpucl1_opp_table: opp-table-1 {
> +               compatible = "operating-points-v2";
> +               opp-shared;
> +
> +               opp-130000000 {
> +                       opp-hz = /bits/ 64 <130000000>;
> +                       opp-microvolt = <625000>;
> +                       clock-latency-ns = <500000>;
> +               };
> +
> +               opp-182000000 {
> +                       opp-hz = /bits/ 64 <182000000>;
> +                       opp-microvolt = <625000>;
> +                       clock-latency-ns = <500000>;
> +               };
> +
> +               opp-247000000 {
> +                       opp-hz = /bits/ 64 <247000000>;
> +                       opp-microvolt = <625000>;
> +                       clock-latency-ns = <500000>;
> +               };
> +
> +               opp-351000000 {
> +                       opp-hz = /bits/ 64 <351000000>;
> +                       opp-microvolt = <625000>;
> +                       clock-latency-ns = <500000>;
> +               };
> +
> +               opp-442000000 {
> +                       opp-hz = /bits/ 64 <442000000>;
> +                       opp-microvolt = <625000>;
> +                       clock-latency-ns = <500000>;
> +               };
> +
> +               opp-546000000 {
> +                       opp-hz = /bits/ 64 <546000000>;
> +                       opp-microvolt = <625000>;
> +                       clock-latency-ns = <500000>;
> +               };
> +
> +               opp-650000000 {
> +                       opp-hz = /bits/ 64 <650000000>;
> +                       opp-microvolt = <625000>;
> +                       clock-latency-ns = <500000>;
> +               };
> +
> +               opp-806000000 {
> +                       opp-hz = /bits/ 64 <806000000>;
> +                       opp-microvolt = <656250>;
> +                       clock-latency-ns = <500000>;
> +               };
> +
> +               opp-949000000 {
> +                       opp-hz = /bits/ 64 <949000000>;
> +                       opp-microvolt = <681250>;
> +                       clock-latency-ns = <500000>;
> +               };
> +
> +               opp-1053000000 {
> +                       opp-hz = /bits/ 64 <1053000000>;
> +                       opp-microvolt = <706250>;
> +                       clock-latency-ns = <500000>;
> +               };
> +
> +               opp-1157000000 {
> +                       opp-hz = /bits/ 64 <1157000000>;
> +                       opp-microvolt = <737500>;
> +                       clock-latency-ns = <500000>;
> +               };
> +
> +               opp-1300000000 {
> +                       opp-hz = /bits/ 64 <1300000000>;
> +                       opp-microvolt = <781250>;
> +                       clock-latency-ns = <500000>;
> +               };
> +
> +               opp-1456000000 {
> +                       opp-hz = /bits/ 64 <1456000000>;
> +                       opp-microvolt = <825000>;
> +                       clock-latency-ns = <500000>;
> +               };
> +
> +               opp-1586000000 {
> +                       opp-hz = /bits/ 64 <1586000000>;
> +                       opp-microvolt = <875000>;
> +                       clock-latency-ns = <500000>;
> +               };
> +
> +               opp-1742000000 {
> +                       opp-hz = /bits/ 64 <1742000000>;
> +                       opp-microvolt = <937500>;
> +                       clock-latency-ns = <500000>;
> +               };
> +
> +               opp-1846000000 {
> +                       opp-hz = /bits/ 64 <1846000000>;
> +                       opp-microvolt = <981250>;
> +                       clock-latency-ns = <500000>;
>                 };
>         };
>
>
> --
> 2.51.0
>
