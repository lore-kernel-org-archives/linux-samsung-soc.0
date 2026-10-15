Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 927FD36CDFE
	for <linux-samsung-soc@vger.kernel.org>; Thu, 15 Oct 2026 07:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792050287; cv=none; b=i3qzfEqD3ZUgbGaE2ZWEKAn8fNJFmd5buCk65Mp2EVGHC52kULxx2PDvvoif5HoSP8xH2bu33pZ1emeNweNW5T4eFb8ZhxDAe2sNAdTkUJMRUiilfVh89kOhGDy1mWijhmRGehdUEfQWf3+XuVR7mn9zMbKiGxeCCIPNFMA77Cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792050287; c=relaxed/simple;
	bh=0UA8dSV6qvMA9myM9p5q2eyTL3r5zJtR3t1wLT4sjBw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=rv4GMwtegim0mNwUgTKvh7Aioz4jI1imjdPzh/mb11pS37tzPtoQDTQd8BPhFd9oTqeJ95dpjuQpOVl91A9KF1s6ocV2ydodUXlFrqdzUif3dSASon2n4twkJtsKUrzbU5furUL8vV7W9N6AOloYDCCzlshqG5u2OBF/3l7HLxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=waS4rwjR; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="waS4rwjR"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48dd33a7bd4so1324212f8f.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 15 Oct 2026 00:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792050283; x=1792655083; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+dvMNnzmsfKlXaQReE9W1eWaATaq+JUXJSwSZca7lFE=;
        b=waS4rwjRImFZkHnseAxDWYX15NVH27l6sGdcGPQT3zxqSHeQrRBK5hFrT16Gc+gAwK
         ksMx10tYpWhf0t+ISxFj3RU6amhJHvuODPxDXspgnB+2kYrYRh9vy5jMDfoTQ/nX/ctT
         h7ZqWVSQDs9ZaTbksPrfSjFYURJ0qf0bh9Tlq8h7myFyf+Q7hfg/7o/TdIF5qpIlynCa
         9NIVv+wRiup0T6k7yM3TJnU9cZSjWhOFBS0uHXsQYQaWwiEglQTReF12KzWSdNkRDdP2
         tLTQs/TYTpBk65zq8b7VDeB263iVdxQJMMRK0C2IdTAAHHuHDdMydVbYt9MRKA140RWC
         /ucQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792050283; x=1792655083;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+dvMNnzmsfKlXaQReE9W1eWaATaq+JUXJSwSZca7lFE=;
        b=CeqaLTUBHPRDDukdCL5APCLbRZ8Z2RxqyXjGmPNXebeduxaa99e13+kVut07Oru1wM
         OsqJlD9jMhkW7rmn9S4rpw6X7Y/L7Vo+daum6XArwvEC2neevwyCw/QaXJMrpIxAcpkT
         XmSI60bdQCpoEocr35jyGFaPT9xYGAV49fwMSEPbnBlnEmXNRgGfGAUtg16nTOJ4Fmeb
         sQ/w+WOtsr8gWLuKEcy+GHre0kr+VmJHMSPHpof7sOMck+N11Fa9T4NYVbeNh4WZ8sng
         /hF0TN6ubILKOjsfhhLs53CQN8IXRXUx6vkuvsUynSMSc7t2DPOf9iBo89J9GLx8q4Km
         db2Q==
X-Forwarded-Encrypted: i=1; AKwUvBwEaxE9YO/fs3UlU162Ah0erezVwXbO+nv51jAWpqYbusEVmSAV1/oyOAtV6ubcTFEbXYEcpFI9U88K4dc1P6EXFw==@vger.kernel.org
X-Gm-Message-State: AFq9FYKhP01V4DjiB9r3ggUEM7hTZkZWKYnUbmXZ9Y/sq8dK3KLTW2Cs
	IaA7zjKfmw4TjQC+NlJT4GwCp49UTRyPMhbk4pM1Rpl+n20cDOmb2UfbNTL00KrbR9Q=
X-Gm-Gg: AYBFou1QFW+e6I1Lnh9uA8hjS0d9NuOd3Lf5wgXeG3z3+QOH++X80qZpXcpvZmpe0HN
	S7l0yo/GWNpOWIJ8gPDzdBG7c2iZF0qhyMV/n8x3aUu8HT+44/rzceULhNFEEo+AyNoaMurqPvT
	/aAO0H2/547oWqtiLQB7lIB5P8kXgH1J09ft5qHwswcD48hJHeHKqm7laakeGGdQRgVM8q6B/Tr
	6dFTO3RQ2Sgbu5cGjRK3f7fjd9qEDLXCn0AXzdONcDQvKTE6/yvIrZDe2PA/oyZV5NPVGM57tND
	bM/uE6ItUjmtqi3qRowB6Yxsbn3AprSZY56XZJDzcQnaYQYmmyKgMFWi86hVyOw/hUtRrNDAz3c
	TcayUyxdkUVy1L1uqXbj0NUD+aDrqzhTOysbul0oqlyXr1TBseCO5yZDRQGzqVUmHRadcyhALyc
	N31lsN8TzXcd+4itw3ovsftSQEDloGf4DMssLNaoeyCRgGeu31q2QfgeW0tye4xjurjitQWawuJ
	mDfvELdCLkiCqhA4EUhQ6c1/6ho9/qf/IhV7a7HX14YVEfvWPZCXGw=
X-Received: by 2002:a05:600c:4685:b0:4a0:27eb:49b with SMTP id 5b1f17b1804b1-4a18e4ae6fcmr385008175e9.30.1792050282515;
        Thu, 15 Oct 2026 00:44:42 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:fdbf:f373:6d5b:93e4? ([2a01:e0a:106d:1080:fdbf:f373:6d5b:93e4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48ded185de7sm8548506f8f.31.2026.10.15.00.44.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 00:44:42 -0700 (PDT)
Message-ID: <8d4d3ec2-3c97-4a46-97f8-048fdf81b853@linaro.org>
Date: Thu, 15 Oct 2026 09:44:40 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/2] dt-bindings: usb: snps,dwc3: Fix downstream port
 numbering
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Chen-Yu Tsai <wenst@chromium.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Felipe Balbi <balbi@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
 Neal Gompa <neal@gompa.dev>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Ryan Chen <ryan_chen@aspeedtech.com>, Billy Tsai
 <billy_tsai@aspeedtech.com>, Michal Simek <michal.simek@amd.com>,
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Peter Griffin
 <peter.griffin@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>,
 Heiko Stuebner <heiko@sntech.de>, Alim Akhtar <alim.akhtar@samsung.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, Yixun Lan <dlan@kernel.org>,
 Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 Minda Chen <minda.chen@starfivetech.com>,
 Shyam Pandey <radhey.shyam.pandey@amd.com>,
 Wei Yang <yangwei1@eswincomputing.com>,
 Senchuan Zhang <zhangsenchuan@eswincomputing.com>,
 Hang Cao <caohang@eswincomputing.com>, Li Jun <jun.li@nxp.com>,
 Peng Fan <peng.fan@nxp.com>, Roy Luo <royluo@google.com>,
 Yang Xiwen <forbidden405@foxmail.com>,
 Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>,
 Robert Marko <robert.marko@sartura.hr>, Xu Yang <xu.yang_2@nxp.com>,
 Wesley Cheng <quic_wcheng@quicinc.com>,
 Stanley Chang <stanley_chang@realtek.com>, Ze Huang <huang.ze@linux.dev>,
 Aswath Govindraju <a-govindraju@ti.com>, Roger Quadros <rogerq@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev,
 linux-aspeed@lists.ozlabs.org, imx@lists.linux.dev,
 linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev
References: <20261014082037.1774672-1-wenst@chromium.org>
 <20261014082037.1774672-3-wenst@chromium.org>
 <7020a7a6-332e-4fd0-a659-d82eb768614c@linaro.org>
 <CAGXv+5G1kgyumbj7wGf6rPFbg3spSO0zYmEkn-hZT4qUdJbytA@mail.gmail.com>
 <03375a31-0ac6-47a4-b0dc-6327080e1622@linaro.org>
 <b4c0761b-34f2-42ad-97e7-ab34ae776281@oss.qualcomm.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <b4c0761b-34f2-42ad-97e7-ab34ae776281@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/14/26 18:36, Konrad Dybcio wrote:
> On 10/14/26 11:44 AM, Neil Armstrong wrote:
>> On 10/14/26 11:29, Chen-Yu Tsai wrote:
>>> On Wed, Oct 14, 2026 at 5:28 PM Neil Armstrong
>>> <neil.armstrong@linaro.org> wrote:
>>>>
>>>> On 10/14/26 10:20, Chen-Yu Tsai wrote:
>>>>> The DWC3 controller can operate in host mode. It does so with a XHCI
>>>>> compliant host controller. The XHCI has two downstream ports, one for
>>>>> HS and one for SS. USB downstream ports start from 1, not 0.
> 
> [...]
> 
> 
>>> IMHO having consistent numbering across controller types would be
>>> better. This avoids making the USB core and hub code deal with more
>>> exceptions, and also easier to understand and write device trees.
>>
>> I was in the impression the port number not necessarily reflects
>> an actual physical numbering, and can be a logical number we would
>> then map in the kernel.
>>
>> I don't see any issue here having base 0 for the bindings and then
>> converting it to base 1 for the XHCI port numbering.
> 
> I thought base1 comes from the USB spec and not just XHCI?

This is my question, is the spec says: each USB Host Controller root
port shall be considered as a port of a Hub and numbered the same way,
then fine, let's use the base1 numbering.

As I understand how USB is architectured, all downstream ports of Hubs
are numbered in base1, and the whole topology is based on that.

But here, we are speaking of physically separate USB busses, one
USB2.0 and one USB3.0, a controller could also have 10 USB2.0 ports
and 5 USB3.0 ports, who knows. The way those will be numbered is not
part of the specification because the specification only the defines
the topology of an USB bus, like PCI(e) defines the topology on a PCI(e) bus.

How we aggregate all those busses to abstract them to software is not
part of the spec, we chose to declare a fake root Hub with a physical
downstream port as a virtual port of the root Hub, fine but this is
purely software abstraction.

We may only use the hardware IP port numbering in the bindings, not
the software abstraction.

We could use the base1 to describe the DWC3 ports, but how to describe
all the physical USB busses a controller can expose ? We may not limit
the bindings to USB2.0 and USB3.0 ports only.

How about the USB4, does it use the USB3.0 port ?

Neil

> 
> Konrad

