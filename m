Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82F74238C36
	for <linux-samsung-soc@vger.kernel.org>; Sat, 12 Sep 2026 00:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789173058; cv=none; b=Ty5F2y5Js2+6h1y9vOvO7zIS36xDqIKcTex0H8CbkHLzgb/PWt7rpvExEHWyBRZUTEMJi74U3oYLCryrwYM5QaUCrvVGWMm9U5WIVJKhQq6HsdapArJPYdzbvwNaz/OeTlbbbKrcDJT9yfunfMLujR0THxFhno7eDNAsabB9tIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789173058; c=relaxed/simple;
	bh=vKZbfu339lBD3I+7owcC+zyR9DvZk2xDRM1VnbxoUD8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=JH7Pp5S4ZpUhmg7vmhIaD/JOuvllRNCURzhwX9mi/fE/K2JSbGrroRWtE2TuLARgaKOpjhXozN62HOrNVGI9qO+qJ/4tJK6nyi/zdw6KtEqSTI/DWGCFB9LCZWZ7iNvKP3Jf8NnRs/NlCk6H++1M+zQN1BO+lg4RJpzF1bh/yJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LC/dccUP; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=i4o65T/R; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LC/dccUP";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="i4o65T/R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789173055;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1vMBB68k8eOZX9nX6OWvjbHaAOl4ORk95pI/5ECFBVo=;
	b=LC/dccUPEAXbAaiwdTi0R4BdaxATKP2xLnqHQpNTie0rY23WWdyWZU1VbC24KBnwNmrsNa
	vmqkdQC027ESKvytCctOerVgRHb1zqajCSDm61gvbRFOE+kZOYpF9b+Fad/xVt0MGoSg4X
	606MpDRzauHTpOJtYsjvK+8hdSPdRXI=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-90-YjwAk-YuNk25sVWP1LQypg-1; Fri, 11 Sep 2026 20:30:48 -0400
X-MC-Unique: YjwAk-YuNk25sVWP1LQypg-1
X-Mimecast-MFC-AGG-ID: YjwAk-YuNk25sVWP1LQypg_1789173048
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91214e93c2cso15431026d6.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 11 Sep 2026 17:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789173048; x=1789777848; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1vMBB68k8eOZX9nX6OWvjbHaAOl4ORk95pI/5ECFBVo=;
        b=i4o65T/RtU5DP+tcswUc3L6f4//7r+U7/+Zo0F3ddDYvbmG8JFCqst08Bs05uBZWGV
         ucb3acHiRMX2RyMhe+SHy9Ei7FWFoJfGGKHzIgEV3odtf42u+ZO5sKgeiZYQ2SnvPD4s
         teCXPbS9XV0+O+53jcONbwENXbS49RQyvs9YvQ1gTOrBFIjju2qZYA93ZHIEbJOTPcNk
         ZUkKCoyxrFtzU8XAQYFP0Q/DCuGymsYX4FuKHSNbQZ8OBAGjJVnMwhjf+J3DdsPd7U7z
         DWpaj60sGOuHy9WCk9tOSIIMXnZLfh7zo/UjgJt1/mlusQUBTriIB08jamOHZ7Nk7qgS
         O28w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789173048; x=1789777848;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1vMBB68k8eOZX9nX6OWvjbHaAOl4ORk95pI/5ECFBVo=;
        b=ElfvnNB1xDZ/2LPFlQO0kEYglZXMka8OkCla+Ld9PJ6OWw/q0g1aIA5hivkTeu4v+U
         DhiRxppRg1effKt/2go+WuogJ/Mfw24fQCqtkAkW1VDbJKbUhukioQBBB4h7ADIGf7fm
         Of9YkvlR5iGt/6ytR9J72z+88THlM9L9QBCmBKPOEF03Dk/qI2tX7Ls8zrbJAdtvsu3/
         Hqqwa0Ovtfs2pXNwOAVE3ibxDrIC1rIA7jxVoMEOaqfFQ5dEaFEm6n4DiWuTtMGBL701
         EagZCyuH/86S8Q0Oj+1JB0gEDnkkgVIwkVWMKVGIt/MNawUB6F+cA3RG7/E7eoO6BlLg
         YLqQ==
X-Forwarded-Encrypted: i=1; AKwUvBw7WM4m1QFcPRyQ2wQp6IZeEWLw+6VGg1dFvLxYjxfWoEO9vB4L2VMKNnDxPY0WBuEj2CPv04HGfpznjXU09ifdYQ==@vger.kernel.org
X-Gm-Message-State: AFuF++lu/LdVZ3XOHUvZUHs9TxnYkMk4AOs9ofFoK9g1ixMQdJydmqPB
	PjxhpVGGSxJSeTmL3Hg17YJwWqLZHy6MJmbTUrT8FS/7hpmlxd+f4QeLXfwqN1LwC3avSS/3J7r
	+91eKStJOFV+JBAb//8EVTag4WndgdUlQ/aAKdDhXvHAS8GE/UyzZ+d/3mLyNsGuTvjq300dKgv
	vzr7l52db+gLci3AGyuwEKbji5SFHu0CHhmfeyDniiax1YmPyXXwzKAxw=
X-Gm-Gg: AYBFou2sVm0EfRFepvnRynPEQHQjaTKYhjxGPEso+BSlCJEFgRaAhLufK6EVeDnBXkM
	PW5AgA7A3skk0/7wULwEhxO7Z+S4DiITnhq/mqsKbCtdnhrPvREcclFCQzpHbx29xWUBVJ1FuTJ
	hMCpEB9cGgQeZLRCQt3czFFpros/HQJEHE9t2M0vAd/WOPqzeho37wAOqqxz7lf7P+6y//WMVhw
	E4B6s96wG1bNaAzU7wjuKh8zecJ6WZf7u4INH5Wb4IvxCh8SE25Nti3uB0MYzEbUdBSROcgStHd
	BvdHi3yu+iaGT5+vhipiOdjTiuSL5hnUYxHNdYKhzGIb8k1ahewcU4kfrDWfjXG1kl0tAHMhAK0
	t2mTtuQB+DuPxtFxbTwq9IOYixOERaqTvd6IShknU
X-Received: by 2002:a05:6214:f6e:b0:910:3fe4:e767 with SMTP id 6a1803df08f44-912120e27fcmr90307736d6.25.1789173048442;
        Fri, 11 Sep 2026 17:30:48 -0700 (PDT)
X-Received: by 2002:a05:6214:f6e:b0:910:3fe4:e767 with SMTP id 6a1803df08f44-912120e27fcmr90307096d6.25.1789173047878;
        Fri, 11 Sep 2026 17:30:47 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f4d51f4sm32995096d6.46.2026.09.11.17.30.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 17:30:46 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Stephen Boyd <sboyd@kernel.org>, Pengpeng Hou <hppiscas@163.com>
Cc: Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Andi Shyti <andi@etezian.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-samsung-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260906033651.84082-1-hppiscas@163.com>
References: <20260906033651.84082-1-hppiscas@163.com>
Subject: Re: [PATCH] clk: s2mps11: Propagate OF provider registration
 failures
Message-Id: <178917297065.837981.2231676629415391817.b4-ty@b4>
Date: Fri, 11 Sep 2026 20:29:30 -0400
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=318; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=cvd5XU2Bw/KJUcvrIFJB31t8tTRfednBzdTJ7JCC5hs=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLKWzDURVt1mW3yjumDLygmbfldOmyzUbt85xyBSICGmz
 Gfd6R9XO0pZGMS4GGTFFFmW5BoVRKSusr13R5MFZg4rE8gQBi5OAZgIyzpGhmlPCyZOv9PVaLG0
 m6mmMfbPI/Fbxl/+l7UsP7bp447U3OMM/3O3zl15LoHNoMDB1Z5rfl4oU+nUSwz2QpOtSzgMkq9
 78wAA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087


On Sun, 06 Sep 2026 11:36:04 +0800, Pengpeng Hou wrote:
> clk: s2mps11: Propagate OF provider registration failures

Applied, thanks!

[1/1] clk: s2mps11: Propagate OF provider registration failures
      commit: 276741aac3b56ba50bef59715ba18ba3f0b953a2

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

