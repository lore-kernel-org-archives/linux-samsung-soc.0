Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D6933F367
	for <linux-samsung-soc@vger.kernel.org>; Mon,  6 Jul 2026 08:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783326511; cv=none; b=YWSA0qNf9KAjVIK/s3NYOUjeC/ijNnETozZFvWwp+trhvGOs+4wQXBvePTHXKfbfW2OTEozdiu3zwjWeAdJMK3NC0yN0vu9Z2NnrOySlxWo4DDvl8sYXRU1qveqTBWtwNJm2oS+KA5BINC6SmdX2bmH/iVD4/K7UmPCSWJSysX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783326511; c=relaxed/simple;
	bh=JJvjvXzlCcli26w+i5Hirhm7MyXZ6wjDQGioyQ2O3Fo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aoaVYWmwyyPof9wkGvF4MV75nhd2oNjGnchG+tTrhwojLACjkZ1lTJNr4Qp6OLuxgMF9kwvQ4S9zCdwlxIpYiWDD8kJ/jc/mq5VXFSUglS7RrP3q0zvVbD+WpXWOST90POK6CaKTVoBCaIA7Dj6AAPAMb+MNWZHxBBVkKaO7GbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jm0Kg9lS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DYOWYZZs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jm0Kg9lS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DYOWYZZs"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66641Zwc3617472
	for <linux-samsung-soc@vger.kernel.org>; Mon, 6 Jul 2026 08:28:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XAhBIVcIgoBMwzdmQI01e6U2QYtMrrtbbOHKP8KiZ8E=; b=jm0Kg9lSibJvV8Yi
	8hdJzAn4zgpP2byZ5O4vxPHA667bXVLXHofUt568kB49iHxnfwvFhctaInLtCjCZ
	sjNHRodxgeyEI+K4Sh5SeEFuH+eYubHtMfiWH/bAUEFyu7LxqpBoChobn1qyHVpZ
	1rLLI4FJJqj/Yk953HEONXVBT+N6ylBmW+SjTQeQEVhfTmxCK8O9BG8vaRt3Exir
	JXmS8JQhSMmJuTk8SMinF8d+mY+jVTVBRkY8NqkZa2/Ot0bSxasJBedLFZ9P4/jy
	oIqrv4PZJHfl9zhVgr7IHFht7qp40w3MPq61gyA4heu2IH0hVtB6bY7pBm7HdH1D
	jKj/ig==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6s64nd3s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Mon, 06 Jul 2026 08:28:22 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92aea0d801dso252075985a.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 06 Jul 2026 01:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783326502; x=1783931302; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XAhBIVcIgoBMwzdmQI01e6U2QYtMrrtbbOHKP8KiZ8E=;
        b=DYOWYZZs63ViB45kaHAd7lZtDSS7GT6CnXI61C+yO6RoMpqdqy5CzBF9NgBk9y8SyS
         +C3Q6NlxiyMd56YUFEro6OpxRQXHGxmjeZiVGw4XctB8EwDRBSy9NW075BZ+B3XTCjKs
         +rK5n92TcpwKW5WagrK++8ddGw+eFPs/uS+TOKdE3MRfmzoyekqN2ZkMkg1IWMYiLiTV
         IZnX9vkWCPfQz/vfNLifUpdngzrSv2eJwDl4yEG4mn72JdkRoY5BRAc7n2vUt72r4Ii4
         9oScewXkufMMurxbAzkuFTERvVykOA+/m2ALfQvATy1UnSqegfMZ97mG7/G3VppCyWVS
         yvuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783326502; x=1783931302;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XAhBIVcIgoBMwzdmQI01e6U2QYtMrrtbbOHKP8KiZ8E=;
        b=TQ9hKjilb8EdGzgP8J4NU1vJ2vldBCDG4Ly8N0E28TM0Ab6grmVoXV+Wv2jeJiFZQW
         YAWRG+f9y1yX4ftpCHPIP9/jLM47dTCFlKj78rNIKTKxyLAVc8qnDrIHLitdScpvMT16
         pVKSqiqgkxs/CD4mbNAraKxhr5Mck9tAoAbXXtDJ2C7BpujmL3deMv0CxltIQFlhXJs/
         f3UqdjHF0rqh4+ucn3tCnB9sykRttTNYXzlgOfdqVlklZCIVnzTTGn+v8iX+Tj7xE2xR
         Uwt89dDX8MnclRv3MC7eVT/ZZzD41cJ1ia5DAVg4+oO0Zz2fsGWf7BodlkkF+ZtBDUml
         YjfQ==
X-Forwarded-Encrypted: i=1; AHgh+Roy6Y4HPZie46eykzbpCfuh8igrk4PHQ9e2Nv/gkktlyrAJTEhRLUxh1g7gaCe6fcGWe9jxSCJGx1o0Pxh1+UE37A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwLYqGwsld+iPs37yREZD3xDF47pUyeMhBg6sEnRl/+L5MUb8/q
	eY8BmqNjLvFqVrvIQDbdTuSl1KzDdjSS5hmJIBJtWCXtstT9GQH9LbVOA/g2RmdUlzEhfb6IEMN
	/E2uUaFhqWhQC0YF76+eLgevbVsrzHW/lbVq6HU12CaPZTL9fGWKWOEpsAZ821em8snMVWbmLvg
	==
X-Gm-Gg: AfdE7cmYKpfO7saJXxs54Ba1Qy1zI+/VJxBR7WjH/xP+xdJOlEjEMw+mM2961BEyKgY
	fPM8DLOKmJvEmfzIg52NXd9ZQwT4cGJy5avPTbeIDyFfYkSKyhogGTKB6AjejDQAfHBhjIO7oIU
	FDCAjxZ7DtVdK+sumlLMU75zM9y8VJgoZkvV3UjAS+JpW9HAruyfWHpW7U00UF5+x40dTUTgvb8
	1etnUhMayiz62flF72V1NjkDeQRYD9ZdR83qJSvXHhWmF5JPibmYW+hkIcKBDnaG+RCXdNC6dDo
	dJypyFBozetgno4nNd3r0TNCkcuefrhUnbGOhI8o7CiA6dDv9WYeQYThN0fHDVaahbzPy1q8UWR
	qjo4TkFYjQ7ftJxQM6I7NjbYAcFKU1yHHC18vF86YheHQBQPtHcrZ94dhHmTPOA==
X-Received: by 2002:a05:620a:2b84:b0:92e:47d4:b485 with SMTP id af79cd13be357-92e9a4ed0e1mr1294195285a.62.1783326501628;
        Mon, 06 Jul 2026 01:28:21 -0700 (PDT)
X-Received: by 2002:a05:620a:2b84:b0:92e:47d4:b485 with SMTP id af79cd13be357-92e9a4ed0e1mr1294189385a.62.1783326501174;
        Mon, 06 Jul 2026 01:28:21 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b62907absm677939066b.33.2026.07.06.01.28.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 01:28:20 -0700 (PDT)
Message-ID: <bc697542-b1e2-41c2-af36-b708ca4aad5c@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 10:28:16 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/5] pwm: Unify coding style of of_device_id arrays
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29?=
 <u.kleine-koenig@baylibre.com>,
        Chen Wang <chen.wang@linux.dev>
Cc: linux-pwm@vger.kernel.org, Sven Peter <sven@kernel.org>,
        Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>, Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Benson Leung <bleung@chromium.org>,
        Guenter Roeck <groeck@chromium.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>, Paul Walmsley <pjw@kernel.org>,
        Samuel Holland <samuel.holland@sifive.com>,
        Michael Walle
 <mwalle@kernel.org>,
        Inochi Amaoto <inochiama@gmail.com>, Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang
 <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Hammer Hsieh <hammerh0314@gmail.com>,
        Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
        Alexey Charkov <alchark@gmail.com>,
        Sean Anderson <sean.anderson@linux.dev>,
        Michal Simek <michal.simek@amd.com>, asahi@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org, chrome-platform@lists.linux.dev,
        imx@lists.linux.dev, linux-mips@vger.kernel.org,
        linux-amlogic@lists.infradead.org, linux-mediatek@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-riscv@lists.infradead.org,
        sophgo@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
        linux-sunxi@lists.linux.dev
References: <cover.1783263835.git.ukleinek@kernel.org>
 <20de6cd60c2938aad2d21397b92742849418ab1b.1783263835.git.ukleinek@kernel.org>
 <973f3d6f-6ff4-4685-9c9f-b07987f74d98@linux.dev> <aktWoIfY_DdO6gb4@monoceros>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <aktWoIfY_DdO6gb4@monoceros>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA4MyBTYWx0ZWRfX3cReneSV37Jl
 s2pTdqZ8YG3Fygn5mj+MPYRVMqRJXB2tyySJ6XvTYnDOveTtdGYjKgM2NaQC2Cdcj8DIKXS7RMc
 geBWKgMzMgvowCNqfDHw59XXimKaJNxhDfligB/rukEIe9EQ2aomEK4NL+9u/McmexJAqrFN74H
 lrU1WTkAxaBteitHB+xb1+Tzlm2543n1M/NvwO3RGacusCZS/Cx1abQ9GvERdr74PwBtRH5yYt+
 Y39anieM0flDYcXueKoX7J5W1PTtJ3RFI9hQLn5wG17Q4X0wG36ssjnF5YFkstRsHSz+F2z62w1
 GCjUdjnKUDUOLLaF61OQQ/LTTY6iRYV3UKzJ9Gghky9ZamYj7DGDBPlrAMnBA5QmMpXTYOb7CVc
 zIKJWh4B9qXIvPiM8YvBFo7o22RVrC+D/BRCv+NPzNGNO1KVv7QZPJCimOhime6oeGrKDovdh9g
 h4U4QWsIwPLyG1df9KQ==
X-Authority-Analysis: v=2.4 cv=VvITxe2n c=1 sm=1 tr=0 ts=6a4b6726 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=8pif782wAAAA:8 a=IpJZQVW2AAAA:8 a=TiEZW8bMWLlPbLH3YMsA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-ORIG-GUID: rHUQlaJq8Ejx5XkZzDyLzEIPL3a4X_RC
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA4MyBTYWx0ZWRfX3GDfIVTa1UoE
 Pap6QCYIpkpPislD7mgql0MhKFL3/1GCDSAVa4HXJGbBTOhyQciL5LiRxGeofU20OlDFynkGD39
 4WX2kvrmnWZHTuGTFs02l0VUxuTLcvA=
X-Proofpoint-GUID: rHUQlaJq8Ejx5XkZzDyLzEIPL3a4X_RC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060083

Hi Uwe,

On 6/7/26 09:19, Uwe Kleine-KÃ¶nig (The Capable Hub) wrote:
> Hello Chen,
> 
> On Mon, Jul 06, 2026 at 08:33:47AM +0800, Chen Wang wrote:
>> On 7/5/2026 11:14 PM, Uwe Kleine-König (The Capable Hub) wrote:
>>>    - Use a single space in a of_device_id array terminator; A single space
>>>      after the opening { and before the closing } in non-empty
>>>      initializers;
>>>    - No comma after an array terminator;
>>>    - Also no trailing comma after a named initializer iff the
>> iff -> if
> 
> This is actually intended. iff = "if and only if", see e.g.
> https://en.wikipedia.org/wiki/If_and_only_if .

I agree this scientific idiomatic expression is not well known
by non-native English speakers, and using the expanded form is
just simpler to review (thinking at non-native English speaker
reading your commit in the future).

> 
>>>      closing } is on the same line;
>>>
>>> Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
>>
>> [......]

