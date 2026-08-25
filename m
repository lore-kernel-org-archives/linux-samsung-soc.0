Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DF763D6664
	for <linux-samsung-soc@vger.kernel.org>; Tue, 25 Aug 2026 08:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787644850; cv=pass; b=fa+sAMqTcoObrfKsIzPNaJ9buEai7Ujc/jbNeACBi3E+Rqf3aWGwxXi24zwh6MuvV57k5oD22uDDAjQUYyqw1w38hb5Lz4c5SbGqdGIs1YzZDhVVI0F/M4PC6LF5TFj/jvrqU381Qm3H3hZTTBrbAoMdWnq97FGD0Ag9Q+YfQbY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787644850; c=relaxed/simple;
	bh=JhXUbAmc4eEDPKk8ugB/b+4DY0/aYbzevBnTQP/qoLk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qgIVisqCAvyROpJnoTqSPeeL1/KYlzAicbo2Y+LCzQNaJ5Fm1U8YFgEuK4Bstsd8dg9MwyfdKepMW+qKyWEvhX93U4vpTkT+qWbOK2WKl8vvRa1Q0t2M8RqkdU94qOW4fdtHgLblp2fB5hbUJdNOMrQQLKoeQdy2aoZSjAYtilg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hW245yiu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GewTwvPF; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hW245yiu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GewTwvPF"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67P2RIWA405749
	for <linux-samsung-soc@vger.kernel.org>; Tue, 25 Aug 2026 08:00:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5i22KieYsA+kqY5NiRh4D02J0ZkjG6AI3NKqJFhFDss=; b=hW245yiuzPpw7Zc7
	TgI5VNmqUcEW+F7q3OTTfJAr9m+I8U+Mi99eCl1qdFtPN2dzojQ3waErOzZM/SV4
	raw/gVvUm3SlExnqFleFA4w3we4B3eHvab/tWFLtTjSZXJfySDZ1DKqwOkHzrh9y
	+zGcn1Vz17mWFL/hvjpDHkwGf9jZMNi6GCRKAaTJ6aUKu4tlA37r3CBEXy+uI1BU
	nO9dfrLc6QhISS+yH/aHgJt0l/HNqwUSn0YC5a4QhIYZwS6zr9RomQjt9CEwUj1f
	SE7xuEoZrCDNPmc33MonGrwEmaAcBQyGQD4H94PSwHSRoxoysR8Tr3DQYjQOiUNi
	/Hr+0A==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8y5jhm07-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Tue, 25 Aug 2026 08:00:45 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e2f61c09dso6685556a91.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 25 Aug 2026 01:00:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787644845; cv=none;
        d=google.com; s=arc-20260327;
        b=K2zUNRJReM8og9jHqaC1rhakUf2dJPnUbI283EyI2lzuPuz9QRk95vPE3B/bS7ezsk
         evHAH+xmhaBGFow8ch3bftiESmsl+GK/s+7Kk6sa9GzVE73ZulPF9hmX5wYFQ1mQwajh
         zVTU2CbHXEbuvZ5t8s8C3c3ZtP5nqqzpv4YrKw7b/cUrmDw+WPW/Ijp5j3ark5JMUYMe
         8ii6hBsWCFKIKtrl7NeFhpftNd8RacnJNkLFp7nAWX9DZ4N7dU6MAvmoR91GaF/mnX4R
         ezBDti0dpAyXwjE0Lwkg8AtYWxkZH6FD9Ig0MUDIr6I0tId47uTxsQXKkEDf8ed2B4oT
         6mqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5i22KieYsA+kqY5NiRh4D02J0ZkjG6AI3NKqJFhFDss=;
        fh=UorJFH8iRM9ixjCiWzRo+xMyZRZpZ4QtMBNnwYX/FM4=;
        b=sI2XxcCT1WaQhESXabuDiEcm6js2JRT1XE7eMCGEVohNyeituLTrOUgLx0bhOYbcMY
         dePebKx0DYs99f5+B/7shhhbeDhCK9wMcSIsfcMdN35i1iyFu4Htka6fNhoFfgFhv7KM
         dWtTQHxGUipr5JJsQ8MNZD1muEQMPl0UqzjCqHkjUnPakK/m8Rxn5zaxcNE4dr1kA9JX
         yVwSOttB73eqKosE0AlAzTRFFjKbSMTAh7Th+iqwADTh7N10Rf39SHrcglzZFfZBwF6F
         v1KwoJbSh1pcnj1gGF4g2x1RgY05+MCubuc8dFxUpMnDuhItR7wJVXJRdcq47JZyRmMa
         PBhA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787644845; x=1788249645; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5i22KieYsA+kqY5NiRh4D02J0ZkjG6AI3NKqJFhFDss=;
        b=GewTwvPFlKrf0UqljTYPAhJVWzr6rL+EIGiL/M8X14z8dWB6YWOrf3nJxqMHWt1HrQ
         NQsSeQj920y8jhB0C50MQr+1YtPZshwVCyEQGMkvTEBrIwQfpb1UDKBmBlAlSTGbP44M
         AgF8hfuauTGUQIT3+U3QIkHDJf+dYO0Qny4ET/yQw/7Jm5FPQexBjGqDDEfhZvfk1Eka
         +vPa+a0QdhBl4zE2QHq2nNjvYOM0KBdhPMQOp8KZNTTKzCwtUnhS9hNUfPmoz2Z1bjw0
         /T9sKl2CXtD3REpXmYpmtg2N0IiYkDnrZ8wpKnunZRyORYBGTreF0VaU8SLnDuYNcwZO
         Q6iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787644845; x=1788249645;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5i22KieYsA+kqY5NiRh4D02J0ZkjG6AI3NKqJFhFDss=;
        b=dmyp9UOB0hlFEQILzYC3iD+Bh3VROYAlYrl4/bbn1yO4TWHofNkrJAt/5lOrP2rmOu
         Y2ek0oojNxqz/lEDZAralsxTgzL17MZ+NCLOO+V7DtL+AdhlVcriQvzZy4jvHAKOicUz
         EUV9AgLdX8QXI+Xj2t2WZc7s74YKCZ7olmuyYIRbdYjLDH8SlmaA/KWaKiXIhp6IbL2u
         SEr11xwhJR1bNdfVyPg5hDNKT3hT099rsFzJlwQvD8sdDA6/LMJOAoddJyOeWeX7NnIW
         iBwbw60XPPw0FYAbAziWVo7JM4tdL+q4dMbdZlSQtXmKXsojNl4gQKl48oc7QJ7Qfk0L
         A3uA==
X-Forwarded-Encrypted: i=1; AHgh+RqSAcEUsn2LB+4o5T2cQKZIXxjl11VFKy7eylteITGvqSV/IqZGo6TiyVeSFGsO5FWy8FfVprT5H9np7BrFWT3cig==@vger.kernel.org
X-Gm-Message-State: AFuF++nlM2Xmxnf6pZVK+cVHhXEKmvrlg+ehfMgF8WYHpqfceNPDRWB7
	0m1g16gCdq9WagdfLiHDjLpjDucI7HvHHKiC74YLKvlD3vpIBXG2Z3s7htnIDm++3b+u5fQEKU0
	vmzaB0Ur7oNJea235S7JaxPHxzOi2ThRPTyLLC/iW+RMegL948V+Xts3Sd+9bCJwSgcZFZYxYO0
	6Um/PM9WXMNju0jitl05Rrwkh2B6VimAsPNVAYTaV/GKjGJag+
X-Gm-Gg: AR+sD122l53yZivsu81Af1pahO2wGl8amuXXH/Xt8j8rbOFtaJWY2dMzC7yx7eLZGxt
	JYwfSxYwnXtL3lo6BbHg00D6cgXnve1ZQmVAk3rJV+PXTo9Uh9cDjRRnWj8MHJd0f3E8Q21glJd
	pFlRnHWlBdJTFz7wk2sO5JYbwgw51NlCUuTlv14AM6iOFmQmQcgTHzSJEu3A==
X-Received: by 2002:a17:90b:1d83:b0:380:9f17:6df3 with SMTP id 98e67ed59e1d1-395c3367376mr54366289a91.4.1787644844849;
        Tue, 25 Aug 2026 01:00:44 -0700 (PDT)
X-Received: by 2002:a17:90b:1d83:b0:380:9f17:6df3 with SMTP id
 98e67ed59e1d1-395c3367376mr54366138a91.4.1787644844301; Tue, 25 Aug 2026
 01:00:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1787239813.git.geert+renesas@glider.be> <bd84df92640a05a1a73a8bc775b2d50568a9d0ec.1787239813.git.geert+renesas@glider.be>
In-Reply-To: <bd84df92640a05a1a73a8bc775b2d50568a9d0ec.1787239813.git.geert+renesas@glider.be>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Tue, 25 Aug 2026 10:00:32 +0200
X-Gm-Features: AcwNN1WaGLEXokEDN-w-P7YAI63J28S_AjYowYxFfZoRRRkDa1AUJBYrsKRUG74
Message-ID: <CAPx+jO9LSfy6-3Gb1+0RvHeVeU9dAN+-1jcGaCESpTZXEAE_YQ@mail.gmail.com>
Subject: Re: [PATCH 39/45] clk: ux500: Make sure clk_init_data is fully initialized
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Ryan Chen <ryan_chen@aspeedtech.com>, Joel Stanley <joel@jms.id.au>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Billy Tsai <billy_tsai@aspeedtech.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>, Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Taichi Sugaya <sugaya.taichi@socionext.com>,
        Takao Orito <orito.takao@socionext.com>,
        Linus Walleij <linusw@kernel.org>,
        Avi Fishman <avifishman70@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>,
        Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        David Lechner <david@lechnology.com>, Abel Vesa <abelvesa@kernel.org>,
        Peng Fan <peng.fan@nxp.com>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Santosh Shilimkar <ssantosh@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Vladimir Zapolskiy <vz@mleia.com>, Heiko Stuebner <heiko@sntech.de>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Peter Griffin <peter.griffin@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Dinh Nguyen <dinguyen@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        =?UTF-8?Q?Emilio_L=C3=B3pez?= <emilio@elopez.com.ar>,
        Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
        Masami Hiramatsu <mhiramat@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Michal Simek <michal.simek@amd.com>,
        Matthias Brugger <matthias.bgg@gmail.com>, linux-clk@vger.kernel.org,
        linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
        arm-scmi@vger.kernel.org, imx@lists.linux.dev,
        linux-mips@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
        soc@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
        linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
        linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=O5QJeh9W c=1 sm=1 tr=0 ts=6a8d4bae cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8 a=xsHTnWN7LAWtonkW0D4A:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDA2NyBTYWx0ZWRfX4v7tovYwxexa
 sFAPiOrxgCBd+X2nvqFvGHzVbsK9LJKdg47VMHuudMKAJaSoQ8uAQUpH8Cbp5++dg+kDdsUlwYp
 idiHuQzJw4EFh1C9udR+KvfPkGwrIKR+rQt6qi/Ll5RX0q9HBDRC3NbUQ3le/8fJGwxP18/INfy
 zShk/lZyjU0Ulyjh7EnCeer8fw170gtOfIKkpOXIYYBjhYKYSQK+ulx/x/AG1lqyxIljbmGpxQK
 f66+rXfuCDyE37aNqXM8lO/28pYspuWZZ5fVKP3Mx1FMy1uFeJayVv3nH3fL2JzzrXya7aSYm+m
 Bv2xCrFAYoLAEMpU9t1vRj/oxs/TRn8hON9KBSjc53INxIG9MToGeVPl+Kx6LtpVW5vmIv3prfj
 A6sA5pUV/O1MDOLBM5Jk+BJTMVqhQRdKyymujaYvhC94gwz4EZNByvyq4Wus5YZEsigoJBYKHPG
 c8skOCqb6KpysHmVoNg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDA2NyBTYWx0ZWRfX3WEon+YlYhmi
 MrZLY9Kpxn/FYyhJcmTJyU22EYlMNrPMUd/f283WwcyUdgE2fd/yoxxMdMc0KIuQGeDGxq9fpH7
 4RuWvcZKboHWz4JZlV6cNb5TO18te70=
X-Proofpoint-GUID: UxRpXvY_k0wffevQBfiNVn_3_ne1ybQN
X-Proofpoint-ORIG-GUID: UxRpXvY_k0wffevQBfiNVn_3_ne1ybQN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_01,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 clxscore=1011
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608250067

On Fri, Aug 21, 2026 at 11:04=E2=80=AFAM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> The clk_init_data structure contains several mutually-exclusive members
> for different methods to specify the possible parents of a clock,
> prompting drivers to initialize only the members they need.  However,
> not initializing all members may cause subtle issues, which are only
> exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
> enabled.
>
> Make sure all members are fully initialized, to avoid such bugs, and to
> prevent future breakage when converting drivers to a different method
> for specifying the parents.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Acked-by: Ulf Hansson <ulfh@kernel.org>

Kind regards
Uffe

> ---
> Compile-tested only.
> ---
>  drivers/clk/ux500/clk-prcc.c    | 2 +-
>  drivers/clk/ux500/clk-prcmu.c   | 4 ++--
>  drivers/clk/ux500/clk-sysctrl.c | 2 +-
>  3 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/clk/ux500/clk-prcc.c b/drivers/clk/ux500/clk-prcc.c
> index dce235df2576dfb2..dde72d2fd0ac67ae 100644
> --- a/drivers/clk/ux500/clk-prcc.c
> +++ b/drivers/clk/ux500/clk-prcc.c
> @@ -97,8 +97,8 @@ static struct clk *clk_reg_prcc(const char *name,
>                                 unsigned long flags,
>                                 const struct clk_ops *clk_prcc_ops)
>  {
> +       struct clk_init_data clk_prcc_init =3D {};
>         struct clk_prcc *clk;
> -       struct clk_init_data clk_prcc_init;
>         struct clk *clk_reg;
>
>         if (!name) {
> diff --git a/drivers/clk/ux500/clk-prcmu.c b/drivers/clk/ux500/clk-prcmu.=
c
> index ac96c46bd1bbf76b..d89f3b634f8bbd26 100644
> --- a/drivers/clk/ux500/clk-prcmu.c
> +++ b/drivers/clk/ux500/clk-prcmu.c
> @@ -200,8 +200,8 @@ static struct clk_hw *clk_reg_prcmu(const char *name,
>                                     unsigned long flags,
>                                     const struct clk_ops *clk_prcmu_ops)
>  {
> +       struct clk_init_data clk_prcmu_init =3D {};
>         struct clk_prcmu *clk;
> -       struct clk_init_data clk_prcmu_init;
>         int ret;
>
>         if (!name) {
> @@ -357,8 +357,8 @@ struct clk_hw *clk_reg_prcmu_clkout(const char *name,
>                                     u8 source, u8 divider)
>
>  {
> +       struct clk_init_data clk_prcmu_clkout_init =3D {};
>         struct clk_prcmu_clkout *clk;
> -       struct clk_init_data clk_prcmu_clkout_init;
>         u8 clkout_id;
>         int ret;
>
> diff --git a/drivers/clk/ux500/clk-sysctrl.c b/drivers/clk/ux500/clk-sysc=
trl.c
> index ba3258c88d28e101..2127a949e56ccf27 100644
> --- a/drivers/clk/ux500/clk-sysctrl.c
> +++ b/drivers/clk/ux500/clk-sysctrl.c
> @@ -127,8 +127,8 @@ static struct clk *clk_reg_sysctrl(struct device *dev=
,
>                                 unsigned long flags,
>                                 const struct clk_ops *clk_sysctrl_ops)
>  {
> +       struct clk_init_data clk_sysctrl_init =3D {};
>         struct clk_sysctrl *clk;
> -       struct clk_init_data clk_sysctrl_init;
>         struct clk *clk_reg;
>         int i;
>
> --
> 2.43.0
>
