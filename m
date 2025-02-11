Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45B7C1E5721
	for <linux-samsung-soc@vger.kernel.org>; Tue, 11 Feb 2025 11:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739273466; cv=none; b=ObeftFDCnVpwxZoeQPJ5Q632pzjeSfbDSwt7ENHmtw+VeJ+oyzOTjs1jSNeSoJdM84ktGCpiV9Cl/IwdibADcjG0xK4a7OEb9RtRrNzlUsaueFzJcxfCRu5Nz9yiUZUJQUUmm7NS7vTo6WSMmlSGN2+P7m+hKVML7wvo0y28X9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739273466; c=relaxed/simple;
	bh=SxRO+2V18543uuVvqtYarJpvwbWlhVTPdjSnXR1nptc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hd9nSaVjFuFa07JITPyra/eys3YY8WTkXkFKnObE0NXuvHkprPZiCc3Xg8icFQjK12A39pGWbZD/j0/8MubkEZq1sUdPEi578eA/Ynldsg6KKG+Tssqr6k7E749JdopzjUWbqqMmp0KUqou5mByiZe2TgcErlFuK4e09PYSaSzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FWrRX0Sm; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FWrRX0Sm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739273464;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XkXaSMBOnMyZHKLeyMgqeVTTrgOxiy57mT/LG6mdTOI=;
	b=FWrRX0SmdDzGc/FLo37O/Kv1uqj/TtZVseuOg1822C+Ap9yn/Y28qJLtqtX770UbWkUWzR
	YLbdDhvVMScl9e7QuBhJu4d2JFeHSRVu5VMSq4QuS7uA0D8uqtEgaV+en06Wpg1zxY0w9x
	aVAllel3CnMIBk+IsSMpmcJnwi3yTtM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-684-WU_W0IofMpOI0N1QH0_MEQ-1; Tue, 11 Feb 2025 06:31:02 -0500
X-MC-Unique: WU_W0IofMpOI0N1QH0_MEQ-1
X-Mimecast-MFC-AGG-ID: WU_W0IofMpOI0N1QH0_MEQ
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-38dda790cfbso1889549f8f.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 11 Feb 2025 03:31:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739273461; x=1739878261;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XkXaSMBOnMyZHKLeyMgqeVTTrgOxiy57mT/LG6mdTOI=;
        b=jiNfu14p+Km106qDctLBwZ8mLLuekvhIc9wSCPgAmizSeHzGw5XjAsq5jDKeb+Sau6
         YMcHroEnVTNT6JyNeQxwLjQ2GhU3Vj/GgoJe+YY6cnDxjEEB3j4ugDws5rDBTjWYQlf2
         DaUQ6L2JYhT7b5xakW27DjU0IPrrkS9wV5vlhU+R+F8BUERMe7ZBTSPLd7yi4WZ76q0W
         jDkQUGMlJ8nVETsCKPjFIHSyjIY/v2Cyqm6cLdnv46UTFwIV5iJP+H6/45/gdIJuZ0w1
         N9XhEuQbqe+Eh+/CJ/EbjiWxda/rnar6sEtvPEI0aX8s36pb7cFycm3ntROg9FapLDFq
         A+bA==
X-Forwarded-Encrypted: i=1; AJvYcCUK88BpqqGPQpUEFMuUGAqitZed0PeWdnGwS++b0d+/V4pFOoMEvcjQ980jQHj7rXYdfEm48+gteXuPfhLSVXpmRw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxDqO7Slray/ZvCNo71BKOY1fXffnUoI0EzDXLY3JBPkgydWqg6
	QU98XZBwfuAiXdGZYQlMV7xWHgHVUDH7QU8vUalAqlgiDPKkEUQXb3daWT27zlfTHUukgf6kHDO
	MXTen+vQuVB5X4ek01UfJ8SUyeScvsICCE9HxPci/pfWFCc4EFs0b/cu92BGQLnIpCUup
X-Gm-Gg: ASbGncsTsUTdYcRq3uXBqJTrKV0dSmmqHs1trlnxlhSMnHDDjjgXWPU+KgJE+MA5Q24
	sars9Ecwbju6mME5Vnzg0NwAexltHrB2hz4cqR2F+S01PK0REIGHht8xBh+1hC9jOkIBdR9LT6B
	Q4+rTmyXwMIBRh47e5XRBQYOg7scKDblBJQtDq9QkjRsC7wi9/W2zTehV1QhvUMNUhqWpNx2FmU
	edv/OvwkfJBnzGPwfxIMBSd2vQSrkjmkNunhY55zjaCYoPTg/Z5DIc/DBfXqQEziaDzV374Sk9D
	H197rXu8gWwM5Ng0ysC8vVgBKWHrQZNKSBA=
X-Received: by 2002:a5d:5846:0:b0:38d:def8:8307 with SMTP id ffacd0b85a97d-38ddef88639mr6802167f8f.55.1739273461479;
        Tue, 11 Feb 2025 03:31:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHayBvfNx73SbQMhbxNkafqfD+FDlmMiZt8eb9H+FDR01lT95RUPwq8zXQKROFW+H5GCWVS0g==
X-Received: by 2002:a5d:5846:0:b0:38d:def8:8307 with SMTP id ffacd0b85a97d-38ddef88639mr6802140f8f.55.1739273461119;
        Tue, 11 Feb 2025 03:31:01 -0800 (PST)
Received: from [192.168.88.253] (146-241-31-160.dyn.eolo.it. [146.241.31.160])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43941ddc8e9sm68421845e9.26.2025.02.11.03.30.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 03:30:59 -0800 (PST)
Message-ID: <6abfb27a-8116-4b15-9485-39e5b1f98c2f@redhat.com>
Date: Tue, 11 Feb 2025 12:30:57 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] net: stmmac: refactor clock management in EQoS driver
To: Swathi K S <swathi.ks@samsung.com>, krzk@kernel.org, robh@kernel.org,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 conor+dt@kernel.org, richardcochran@gmail.com, treding@nvidia.com,
 Jisheng.Zhang@synaptics.com, ajayg@nvidia.com, Joao.Pinto@synopsys.com,
 mcoquelin.stm32@gmail.com, andrew@lunn.ch, linux-fsd@tesla.com
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 alexandre.torgue@foss.st.com, peppe.cavallaro@st.com, joabreu@synopsys.com,
 ssiddha@tesla.com, xiaolei.wang@windriver.co, si.yanteng@linux.dev,
 fancer.lancer@gmail.com, halaney@redhat.com, pankaj.dubey@samsung.com,
 ravi.patel@samsung.com, gost.dev@samsung.com
References: <CGME20250207122130epcas5p1857043fa03e7356dc8783f43a95716ef@epcas5p1.samsung.com>
 <20250207121849.55815-1-swathi.ks@samsung.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250207121849.55815-1-swathi.ks@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/7/25 1:18 PM, Swathi K S wrote:
> Refactor clock management in EQoS driver for code reuse and to avoid
> redundancy. This way, only minimal changes are required when a new platform
> is added.
> 
> Suggested-by: Andrew Lunn <andrew@lunn.ch>
> Signed-off-by: Swathi K S <swathi.ks@samsung.com>

For unclear (to me) reasons, our CI failed to pick this patch. I guess
the too wide recipients list confused the CI, I suggest re-spinning
including only the ML reported by get_maintainers output and adding the
target tree ('net-next') in the subj prefix.

Thanks,

Paolo

