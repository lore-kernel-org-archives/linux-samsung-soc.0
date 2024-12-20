Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 555EB41C6A
	for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Dec 2024 07:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734681098; cv=none; b=rtU96rGFyVMN1pqmbE4KhEzX95GgYOz29a+3tVS+aiOSxCcAP+yKcNpD3yXWEpmhQoEPW93FpOpR2uQWai1PPn10hqj/WxJuB5Az0rZKFQ8pvKjQYvhez0gmIaEMPBLux5tDUoyFMTujc1cLTtN6oWPk5y8D6ogZuM93hshrzL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734681098; c=relaxed/simple;
	bh=OkhxNHA3+1HeXND2fLL7BiKnkbPD6f7VLBpp4jFIE9I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FnrAKh4pzEOIIRWoxGQaHdn5aMTp/8OiYi31U4sXq3VfsiKBmZA3mXg3/MxoAMooN61tSj9NtlZ2B+9tCWZkT96LzWNrt/jNe7/qdNwWeKrT0b383EV4r6vFBy4pgxWV328EURHk4vubKLW6P+cKMy4875Vunqf9gWbFAv7r8fI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BUhZPMgB; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BUhZPMgB"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5d34030ebb2so2566350a12.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 19 Dec 2024 23:51:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734681095; x=1735285895; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1yDNEjeOXhSBQxVpqQzt29i9g5xlvEhh8lAhoI+DC6A=;
        b=BUhZPMgB+pTKuonASRxgax/MwsDc/6h6DZLcwbGWsjU9+g+pw462OQMFWOVvjE7tbg
         ZIIFtVyPtL1g93g270N6dg/9o4AXQzns62VBEjUpOVBDIFpvka7AF3qIoK2O5rIxMN9t
         U5YB9OOVCibTQ+vzlL6HcxsS2FWUzhfwS9bg7wYyGukKuhqfLga8g0JCvq+ZuTIAjXIZ
         Q/5rpIrI/Z/iaTzhdMLzIs27mC4LWPRqztN9O0dwKT9bX+wAXBXZaGqoveWgBCa8+S6A
         aN5XFfafQqTbwgJ2pu/fixzRZlEx0SX9VH9jDBUgDsnTgOKRUed1WMLtiK1JxJrGa1cr
         g4DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734681095; x=1735285895;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1yDNEjeOXhSBQxVpqQzt29i9g5xlvEhh8lAhoI+DC6A=;
        b=N2dOlWvYsxUleynzUNpitvm8kyzlKtV9WfAmhTY/LUHhJFGC5p4Spp2TEcdnxDSlqj
         Tn3oGCR1pXGLr0DJPpDtzGVJ1HnmxjTalVlyTy5NI6LkpKAWp5veUhEtEjbN6ZrlcIKX
         dnfWdSHZiHlfs7NcQcPFqObIIFz6ekugyn6bsV0c38acbuQXi9QIYNcUwSdRrjqWbvt5
         Dx4U2ApCqztq+pSnsHxlTQ0YCRTSF2ZGCrPwCEkPwinX+akzWSE+7l2lnzwHBL7WJNqu
         dLDBbP5Rf3kDKvLSb4ZPS6NG7d35mpRRYY5KcHY0Hn1yYdnCkZqhcNFEcVVdAP3qQ/F4
         4rBw==
X-Forwarded-Encrypted: i=1; AJvYcCXhZGAXMy8IUteAoVPtxv3gRzaprbvsB27vxF9Y/RQOOiLcwclfhoghkh4XI2/Iobh/6UHP1pimbkZm01KX7M19nA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyr+TjNKpc/SGu3Mgc1i6Ael8rwNCjrWhf8jVfjbBp1jJEuBusM
	VqYFcYwikw0KEhuMCNysKrErlD1wsZDRVpOE83kQdciDcO7MfiwCtpjW1Jet5yY=
X-Gm-Gg: ASbGncsyiO4R2QNgOyet56qJSCVFgaAuJcN0zY+2PbrExRC+1SnGvEe/OvjL4La7UT7
	eVd4WlLvh0SWKvEjr7fi8ZUFm1LxMHotOSzQJ6kaSeG2t7+Du0qv5NYtJlGnnQmKSJ90IZIES4/
	AqQ6mwalhh9551Y0liENacmRaomUcr6k83kGSuwbha3ivBRusnbefeWkpPSb1k2JmesKgMHatHS
	BisYVM6pFtl28R7V5Wmn4bYY2hxU8Lxrab2GwWeDv8N/wNt+rjO9ZalTpcFUv88
X-Google-Smtp-Source: AGHT+IEI1vajsERhxoY7nkjgpoa5z0LmbYvw4+7EEXmu89uOcdENi+jRRpqlKSn6v1OKOHvsdYTmuw==
X-Received: by 2002:a05:6402:518f:b0:5d0:b51c:8478 with SMTP id 4fb4d7f45d1cf-5d81dd7f300mr1334456a12.12.1734681094719;
        Thu, 19 Dec 2024 23:51:34 -0800 (PST)
Received: from [192.168.0.14] ([188.26.61.92])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d80675a41esm1450399a12.1.2024.12.19.23.51.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Dec 2024 23:51:34 -0800 (PST)
Message-ID: <463d5955-a056-40e1-a46e-f89ac0dadccf@linaro.org>
Date: Fri, 20 Dec 2024 07:51:32 +0000
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: mailbox: add support for referencing
 controllers solely by node
To: Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
 Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, andre.draszik@linaro.org,
 peter.griffin@linaro.org, kernel-team@android.com, willmcvicker@google.com,
 daniel.lezcano@linaro.org, vincent.guittot@linaro.org,
 ulf.hansson@linaro.org, arnd@arndb.de
References: <20241219-mbox_request_channel_by_args-v1-0-617a6910f842@linaro.org>
 <20241219-mbox_request_channel_by_args-v1-1-617a6910f842@linaro.org>
 <20241219-recent-everyone-865b19864693@wendy>
 <d9e635c8-de05-4812-bf2b-11651f6da5c1@linaro.org>
 <20241219-strum-cheese-89e5e60d22c3@spud>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20241219-strum-cheese-89e5e60d22c3@spud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 12/19/24 6:58 PM, Conor Dooley wrote:
> On Thu, Dec 19, 2024 at 03:42:11PM +0000, Tudor Ambarus wrote:
>> Hi, Conor,
>>
>> On 12/19/24 2:11 PM, Conor Dooley wrote:
>>>> There are mailbox clients that can discover the mailbox channel ID at
>>>> run-time. For such cases passing the channel identifier via DT is
>>>> redundant. Add support for referencing controllers solely by node.
>>> I don't really get your implementation, why not just allow #mbox-cells = 0?
>>> That's what's done for things like fixed frequency clocks that only have
>>> a single output.
>>
>> Ah, indeed!
>>
>> instead of:
>> 	of_parse_phandle(dev->of_node, "mbox", 0);
>> I can do a:
>> 	of_parse_phandle_with_args(dev->of_node, "mboxes",
>>                                    "#mbox-cells", 0, &of_args)
>> where #mbox-cells = 0;
>>
>> Or ... can I pass NULL for cells_name and make the #mbox-cells property
>> optional and still keeping its requirement of being at least 1?
> 
> I think the mbox-cells = 0 approach is preferred, that property is what
> marks it as a mailbox controller after all. Perhaps Rob or Krzysztof can
> comment?

I think using mbox-cells = 0 is better indeed. In my proposal I
considered the list to always have a single phandle, thus a reference to
a single mailbox controller, whereas it may be possible that clients to
reference multiple mailbox controllers. If so, #mbox-cells needs to be
defined in all the controllers, for consistency reasons, similar to what
happens with fixed clocks, as you already mentioned.

Thus I'll change the method to:
struct mbox_chan *mbox_request_channel_by_args(struct mbox_client *cl,
                       int index, const struct mbox_xlate_args *spec);
and use of_parse_phandle_with_args() in it.

Thanks, Conor!
ta
