Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EBD313D279
	for <linux-samsung-soc@vger.kernel.org>; Thu, 19 Dec 2024 15:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734622937; cv=none; b=JMNYXOIQQKIS8yWZeWdJVckAgAvHxv6BXqEfxKKeOrJUEbUW8gPsrPAaPMOxp/ml+ni/62RcrIe3imCbNMCKafpx3UTot455EfhB1U0SNRtRv9mjl98xCi/Fz9fv9oXgAZEJ0W1GkV43vS89uyhburqLRZ0VNztqFW4ERfE5iXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734622937; c=relaxed/simple;
	bh=3kN/RnhQ9QqdZSgvidS0+FBUIXfMb2wnA7n2uaBSRXY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RwDu97p114UUKGNP1OiQyFV0v077xECb9TXPHNdwKDA9qqcJRSd4xXQJsuc0M6p5En8tMvJHycJbzXqFwl27jJsWPsULWUa5Pda5fCakyAyRvaqZ0iyU6ny49zGvR3/HSnQQLJ0FvS/JVqChPkQQL4tbhHtqWnXyqZaZxsm3TOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TY8MBVKI; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TY8MBVKI"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-386329da1d9so469856f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 19 Dec 2024 07:42:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734622933; x=1735227733; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rWgkw7lmexiViKq2PxMUqduxvXcrYGn0gpO5vp9Rz7Q=;
        b=TY8MBVKIgGh73qp5gdAbxvz3hhcfmJwGB3TmO8Trx3xmov/d39M+nCX+lFNCMLhYG/
         PPziBnCbQ1/m7Q2NAizCR/ti5cgraDBYvoZI+R32DEFic2378b7tV2I9PlDPzCid5i22
         vWt87j02bn6AbZmlmM+6vIVln4aghIR4Lr2ms3nvANIC+knieylH3OfSlPYFN46eMf1A
         BNHtXu36g7k3PwupPKs/g4ZigXZaguPQOmUb0E23AtV3tvio/flzc/H76r0uBnWazQZr
         zv+BqvW0AjctCI17t9t6RfYyLHb0QNJlbEM02qXM3JKHl+tbZ0UTVt8ugZBJZYWM4ccR
         ubHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734622933; x=1735227733;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rWgkw7lmexiViKq2PxMUqduxvXcrYGn0gpO5vp9Rz7Q=;
        b=lMOd5pkSr22DSV6Q/NwxQH6fqk03YPeQ66JIa8mD/YVBoCm2xUwHsKRAfrtn3sVu2v
         FK0FckrZ3RO4P2ReB7XcB/l+lq8Al2oyb2gJjSi8hBQXAycPVN8VnKaMxiOx/7wBURpu
         MKNz/NM/3a/BEOonLSpv6SYktkv5aPE0ok+6tv54V/ETO0dmaU11NBjelSVw1/+t3tpM
         b95HHhQajzfLKoT3xM+zvfJ87mnnbJhojBGNjY9/t1IQlTD9f2DuKnkSyYi3+PC1Mcun
         oIunKE2RXz10sIMsTeajMZLjnP9/Yyh/ZHOKHsABK8eRHLNSpasBYuZXOvN2m8/NH9RW
         mYuw==
X-Forwarded-Encrypted: i=1; AJvYcCVFSnBN1FiHjl/xh+czQJwUeek4IzPgq39c6u3p4HtzEft7gLxEXqq3URR710eKfhT07ap0zHs8xfAQ47EHPtOuWQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyPkEV53CeQOT7Vho3x3ayFLGezlsFl91ukAKjvFHXiHFSozji2
	5a/yu5aiwhCz3Qik0/M/Gn1SzOMyJD7yIo95Wk3Z8mhKtRByJ+UIr6R1EpVIH7o=
X-Gm-Gg: ASbGncvOI9y0MWgExDsZD/M62r1pg4kohtLo0j6uceNN/OQNQUoMjYnpaiDlxapD6yZ
	sppVCDF2FO0PLGx2qr66gYSRFxqBcMXujvCBOYO/i3iJDF19r076hj1mwf2x3XzM9zukt17yn0G
	eGVCFu8aR4PPcVBgH/5hEgDzMzLYrqqIgvJunELF43WeKNKGCQ++kGRIGIs+5bKAon6FIVIf+93
	7+rf9J4GIlXLBLjCZTVmFy3e29choIBnHvsH1zfAt2qxLUGbvt85TMI4YXD/Xsr
X-Google-Smtp-Source: AGHT+IHyTbXfmMGun8BgqdCNy/tymW9cvuteP7xXPOqYhxYi6zsB4192YIqC9FG7M9zeEWdBkq3JFg==
X-Received: by 2002:a5d:6d0e:0:b0:386:2aba:a7f6 with SMTP id ffacd0b85a97d-38a19b47ecemr3753765f8f.49.1734622933377;
        Thu, 19 Dec 2024 07:42:13 -0800 (PST)
Received: from [192.168.0.14] ([188.26.61.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4366127c639sm20872915e9.31.2024.12.19.07.42.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Dec 2024 07:42:12 -0800 (PST)
Message-ID: <d9e635c8-de05-4812-bf2b-11651f6da5c1@linaro.org>
Date: Thu, 19 Dec 2024 15:42:11 +0000
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: mailbox: add support for referencing
 controllers solely by node
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
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
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20241219-recent-everyone-865b19864693@wendy>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Conor,

On 12/19/24 2:11 PM, Conor Dooley wrote:
>> There are mailbox clients that can discover the mailbox channel ID at
>> run-time. For such cases passing the channel identifier via DT is
>> redundant. Add support for referencing controllers solely by node.
> I don't really get your implementation, why not just allow #mbox-cells = 0?
> That's what's done for things like fixed frequency clocks that only have
> a single output.

Ah, indeed!

instead of:
	of_parse_phandle(dev->of_node, "mbox", 0);
I can do a:
	of_parse_phandle_with_args(dev->of_node, "mboxes",
                                   "#mbox-cells", 0, &of_args)
where #mbox-cells = 0;

Or ... can I pass NULL for cells_name and make the #mbox-cells property
optional and still keeping its requirement of being at least 1?

Thanks!
ta
