Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D8052FCC0E
	for <linux-samsung-soc@vger.kernel.org>; Fri, 19 Dec 2025 14:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766154959; cv=none; b=UxCKRwc3kc/o4yU8FlWU2SlG+pYsajcfL6FNVIfPL6Qv+rppLMeSeTAOPsd4sySX+FzTM1GAqzovKVOVF7AP9HnUfS2ysJg/T+CRIs0m6zbGkNNKf+qXCbIm1rDQuGOKGCWPTubPCNDvOHP9baSxbbtwyr867row/GrvXQMHMxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766154959; c=relaxed/simple;
	bh=yDoEuSqPknkwVP0vazPsHzAq74kjVOByu3+rGhvA4Fg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=k6RsoKffQP9+9DvRgdsKBqXxn38/SHt5kdm1pxTWdS+QjBdw4hDkhm1MQunpz9iu9GaQtE07UyR4waTctFrN0NBfauSLgBjLNNgjS9Vdm3lnFZ5eih04cgzHHBtI6krWG2h+Zoj4Y5c1c9MUUDILuyfRQVIg12jwL5ffKyhuZ8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H8MbEeMc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OYVcs1k5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H8MbEeMc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OYVcs1k5"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJBunf83976825
	for <linux-samsung-soc@vger.kernel.org>; Fri, 19 Dec 2025 14:35:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=bdVHcop5XYNpYgY2yr+3Fk
	dwW8jh3IpYWt3xSgH8iKA=; b=H8MbEeMcDR3OAyNCv7ZbaT2jGgjxnspKFvfma+
	vScLZ9gcIKUB6mzGCGSe+SxrLuEEDnIbhO1DoJYyP7+dNsiltp4LXZv/n9omciUp
	pypqg41B//O4+bkm7RqZbiq86vn0gkxpau8mlREVwrUfL9IDtwx2A4oFyE7L43Im
	JlMVs3ZcmKnE8+hCLCoWOBwuMHZ0MQWhQ37xONF7dIS6FmijR3ekq0KhWEB3zyoi
	UIe94lKxvqPbtGJDSj8vKtJBOSVbxN6fow7n9s1gDjJt2X4sul/5TfpErnoUeCwP
	tJrAxrFfXlH1yNXXRiCjiyRZcIQB/eWgFOKuxJHxPpCZ8NnA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2fjw2f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Fri, 19 Dec 2025 14:35:56 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4f1d2aa793fso41308071cf.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 19 Dec 2025 06:35:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766154956; x=1766759756; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bdVHcop5XYNpYgY2yr+3FkdwW8jh3IpYWt3xSgH8iKA=;
        b=OYVcs1k52QbPnKMA4MwxX09Y6FJusRTJhXewXZ4Jp1PPLa7iEGX7RCzb9wnn9zh4E+
         /qscc2iTyhfb49Q8Dbml0yBgMPmwEMZi2Jn/rFMsCa6JnEvM7AdIpYPS9gd9Kwwik7Rk
         kqd9NWzQL3URIJ2XEwp8w2TnaaUC3aB45EC/gGbWb6JpsHHbHd4242PiirirNRfnUJYW
         lVAViYGLePlbyu+ygwXw239u6XD3mSl2oifUVLpzXz0mDqwaKwtFHWbSgFTPjXd237Ns
         1YCT9MoBF6KSVvuc8xt+MQb1WufCz6maQyDyPWoYLyGoliIfoVOYxSA/wf8AsbP/wupW
         WZYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766154956; x=1766759756;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bdVHcop5XYNpYgY2yr+3FkdwW8jh3IpYWt3xSgH8iKA=;
        b=EK0DarejXkN8shu7tnIq3gFWAVBUE359CzMOUEG/8FcF6exl1ZD8XaaCXzAwmlrEti
         FkmzmmuPhWGiIj+Gmw93uELRC8W7G4pM695kSwU8KrJ6h9L3nmF0FEzocLIhtDxqU3PP
         tu2tqFk87RWxbYL4PdJDmvEo9uEKjoVr+ObTqyiKrL+8D0P/V5zAokDHPF4L45bKIv/i
         4X3g9xsaO+eMvM7fivnqmhlybEwxVHGoShgBNkzKkmKX5v4MepeDFbbYHXFGqrhGKxIh
         5XymBCIccu0yA4R9LFAiCP+CatLLYI7WEnvq65VlhG5fIJnwJMMpOrK4gEFPW7LlbLyK
         CvfQ==
X-Forwarded-Encrypted: i=1; AJvYcCV7M5z/EX9YkGGf5f11ZC2ll5ZfCW6rlswofXv0b7sT5+jV9dpMhbCBHV6wV+L21F2VudWhkklrWrbhnerlQCwFKg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxHvHKWk1DSEd92/67VxTZmRwjCRo1pM3dusxYSdNaWxehnAX61
	GGomqJbznWAdLL+1BCjSn9bWS1bqOoTPyJkhLLsHwxqVPNnlNOxWfla0oWShRHNBfSedbVHfyQ+
	oNl7kACWfeKXuflHcVyp4lEn/Oivy59ixfhPpzFjRUCecyMzZuFvxuHR9ip+9eHKe/uqfgB60tg
	==
X-Gm-Gg: AY/fxX7NzstVzTML0TnIUTA4tIpyHa5EgnM4hGo/0CHkGUlIooIZ6H68Fa5BPvvZ/QW
	ZO7UGnvR4WWNS/GmdFV8Y5liKd/O84bf0ITRfEtUAmhoOD/eskUSoQPipOz0+w1ztpnRGgtVfYI
	RjLPga1ECSqhYFmH1EHTjD62QCCqmgTyUTrayX+7PPV3CTazvl4F4+JF62MHaAUk5Alhf3amZ32
	8NEjREuBj3xZ8dOQVYbbyNmh9F8sG0aMDfZZv+k6Bpcdi/ULTiK1despJDt8c/PlxXT/bfHzi9X
	8boyzwlYc6FiS93k/m808URzdmVqDFJnoudMApU+rQsd6mwT0m9w916LiQmahxyYr4qazM1nHwM
	XMQgd/BwsXJuZ1QXTfhZ4xy0JiHnbFYIQA+0gyyTf3pHOdQSVAgIbgjjlHPO3EdZdfGCk
X-Received: by 2002:ac8:5d08:0:b0:4ed:ba76:a008 with SMTP id d75a77b69052e-4f4abdb4c88mr38662971cf.73.1766154955449;
        Fri, 19 Dec 2025 06:35:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEffbFxw8X7dSObyQoz5slOTM2CgBwKcXa5e7U5F4RvPeNF54VvXGRIgsWbtWtrOWj00iptUQ==
X-Received: by 2002:ac8:5d08:0:b0:4ed:ba76:a008 with SMTP id d75a77b69052e-4f4abdb4c88mr38662351cf.73.1766154954913;
        Fri, 19 Dec 2025 06:35:54 -0800 (PST)
Received: from [127.0.1.1] (83.31.98.88.ipv4.supernova.orange.pl. [83.31.98.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037ab7f86sm245145966b.17.2025.12.19.06.35.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 06:35:54 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 0/5] iio: adc: Simplify with dev_err_probe
Date: Fri, 19 Dec 2025 15:31:49 +0100
Message-Id: <20251219-iio-dev-err-probe-v1-0-bd0fbc83c8a0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANVhRWkC/x3MQQqAIBBA0avErBtQU6iuEi0yp5pNyggShHdPW
 r7F/y9kEqYMc/eCUOHM8W7QfQf7td0nIYdmMMo4bfSEzBEDFSQRTBI9oZv8oJXdx2A9tC4JHfz
 8z2Wt9QO2tb1AYwAAAA==
X-Change-ID: 20251219-iio-dev-err-probe-59b3104c8d4b
To: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>,
        =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>, Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Heiko Stuebner <heiko@sntech.de>, Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>
Cc: linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1006;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=yDoEuSqPknkwVP0vazPsHzAq74kjVOByu3+rGhvA4Fg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpRWLDVzK3BklVItpqweq/1miLacOG2Cpj1HQRt
 qYMIHAS116JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUViwwAKCRDBN2bmhouD
 1472EACOzRsssmSeIC4dDsW9cdUyuX/1DfAEF31eNrw1wC0pyBMfIWJNnL2LSlQaWhLMVwkDaRx
 Q6qs5PZ+m5HSWN0c9B1IYnCaBdkg9i1tYfZx91zD3cFo8C3sFJ4cHai7H7f0h5OmhvOyZ8FxR0l
 al06ryQgbWCkyk9k/tWLHL+q2IAlhtfGuCtZ0+fD5kpkZLoVtbbKrTKNwlVTaY+cXWQF4BIIyDV
 AMV/sIPce94hEHphyKJlCqioXya+WMGdqumincCRkLKMIeFBE/peXUw5dYNkajIMJM6xU8axA9R
 lR5qS6Vd9zzuiKbtXRwkUBxu6Iv1eQsH449ypPIU4urZxHPbWefEF8x+KFqIL8jM9LWWev1CAwJ
 uVo9yYZ46EPZiYJe+xWkunZymrftSRkCkihcfalicTpVtRcgFWH13sIFqP9XK+0nlXJ4AXngRjp
 4hS92gmbRS6+yzCsyH9TqRxujuDbowBSxua62u0DdBeX3T47ruoQmDUCcaEPA/SKd3HLoYtpSCU
 SGunXOmPp04MuDM//S4PdHiyTXk7EzNoF6JXSrC7AjaZoEuWbadPnfJGv0EEIJLHvzKkLDByrgB
 RtS/oL0QhQ6zURKrKaZrsnxmBVjr09C/uqHNhnmkj7XmZNMFWZ7b1G8b5QH0AjIGARciWoIiza4
 zNl2KZibzhmH4ZA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=NODYOk6g c=1 sm=1 tr=0 ts=694562cc cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=qe4J/qXhiWkb1JZGYKbLYA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=pGHnGGPHKRB7WeD4iHgA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: MXna7EwUeqy-XMRtFDPSHNXuvlVAIZkP
X-Proofpoint-GUID: MXna7EwUeqy-XMRtFDPSHNXuvlVAIZkP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDEyMiBTYWx0ZWRfXwkM6uPR2Myz1
 G16BLG6dJVHoQg4XDSn7zTc4g4bcrKDD7JK4oywwsZmqygINpk/NXgXRUgh+ivq2I7mZ4GHTDQR
 /irw6BdiPJwf5/DPRD5ivspDn5FGUYbFYega3RtqGNehrolgCuft7bCLz/WxH2vz73eARJLVgGE
 +eIO8OvKWzqIR+HWV+Puf6unCjLzbWijxCNjxy+zT58ZPiJOdBQD9lsSYFdxVsyY+r6O7CcA8VE
 Lzwq8WMffaHH/y0tXVuFTGJY+lHxDZ16z2hJrEJiS50wTYPIBc3/gupoxal/dn1Rr5DC5yfKPiH
 Db7xsgpqV5ZZNvLKebCM8M13MfsJLnHcoo/f75NnZngEH4eOC9na+4myzVEYkJT0oFvgJQvxdzs
 C9oQajl+7FPIkcuXZu6sGtn8Gu7AG+7Krpy3CB7k7qWK/RbF5EVxOPt1ES820RQHcCytPdx2664
 e5O+uAw9c8Wql2Qxj+w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_05,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190122

Use dev_err_probe() to make error code handling simpler and handle
deferred probe nicely (avoid spamming logs).

Best regards,
Krzysztof

---
Krzysztof Kozlowski (5):
      iio: adc: aspeed: Simplify with dev_err_probe
      iio: adc: exynos: Simplify with dev_err_probe
      iio: adc: qcom-spmi-rradc: Simplify with dev_err_probe
      iio: adc: rockchip: Simplify with dev_err_probe
      iio: adc: sc27xx: Simplify with dev_err_probe

 drivers/iio/adc/aspeed_adc.c      |  9 ++++---
 drivers/iio/adc/exynos_adc.c      | 29 ++++++++---------------
 drivers/iio/adc/qcom-spmi-rradc.c | 20 ++++++----------
 drivers/iio/adc/rockchip_saradc.c | 13 ++++-------
 drivers/iio/adc/sc27xx_adc.c      | 49 ++++++++++++++-------------------------
 5 files changed, 43 insertions(+), 77 deletions(-)
---
base-commit: cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
change-id: 20251219-iio-dev-err-probe-59b3104c8d4b

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

