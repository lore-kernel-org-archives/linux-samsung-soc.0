Received: from wfhigh8-smtp.messagingengine.com (wfhigh8-smtp.messagingengine.com [64.147.123.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAF01157E91;
	Tue, 18 Jun 2024 14:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718721849; cv=none; b=Gs12HNRGJuxuxUxM26+ic+f2UlV78b05DqDAoo9p4Axg8lJEsQIrs5TsjlzMJaOJo1zTw9HgBp79Dm51HZjc6PgX7j/IGTtm23yr68gzFiBsyE30azbN6yPqK3ysL1iEdDuu9v3llzrvSVZZtVKpl2VZMnser2kBziwmLwll0Es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718721849; c=relaxed/simple;
	bh=ml2UhN0QXyqPQlq6C6npK8L85MIMec/94MkmrBjN9CM=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=JBLiwsGULmpLDkoupyloaxXgmZBSV5LefKIseNWyK2DTgtV6JXYcnFIZnZe4KuCE5fz5HmKTSQ9R1RXuDUaE6YfYJfLOWBxghu5TLrHdQmT2YE5gwpiT1scp3iuSMhnsjCQYFcsP54Zx+ywWvmVWkRl60ltODoYE4ACTBR/PjPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=GGg2XXbp; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=tppiOctU; arc=none smtp.client-ip=64.147.123.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="GGg2XXbp";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="tppiOctU"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfhigh.west.internal (Postfix) with ESMTP id 46705180009D;
	Tue, 18 Jun 2024 10:44:06 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Tue, 18 Jun 2024 10:44:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1718721845; x=1718808245; bh=3CPbe4SFQV
	4/zNzAZ9bSUaLdRIggzJj1JGK8pDrKFzM=; b=GGg2XXbpDKzrRcruoOQkP/ytUy
	s266qFsw2ztkXsfcW7HJWvvkXd19YyV+h7oHp7J+uRbAH34OTEstuuedjH7BxobC
	zsoIOjg+qrUNu9pGUPyuhnGvYo8oQDRsIlnDRT7bI1pjTTD6FH2HcpiBTv4sL+ei
	U7YdB59vt3ji16pZGXgkSjeSAxhOifhyyjOGXzzJHK5kd9odgPHImTApJ4DnexX/
	CRluElp7EmPIqQWsxcuvrBwzJ5Qpltptdk/N8mPZvKbTnVzcmqZ80KoQ90b8YLui
	pF/XTCoEqGSV/fG/uV+6FMS7JFk64sH+sl9lxN+mljQIT9Puwxh+9hJzfJSA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1718721845; x=1718808245; bh=3CPbe4SFQV4/zNzAZ9bSUaLdRIgg
	zJj1JGK8pDrKFzM=; b=tppiOctUrp+Qbq9ukuJQ19ckrJFVwhlVKY4W4IJQExBE
	8A8kka6kg15+bBpbHxrWc946VpI/2oKxamszagJJe1n+ib99ka814ZZVRNUR3NmT
	i7eiVHqyeZvX3AE0WWxuol19n7Ngs9p9vXMSf+mFpUPAV6p6QHYrH5/oQzldo4/o
	OIUpAF/U0ZkqLl9othgGAlpw+EF0LkU0sinPZnIkHO+v7Eplta6mQC07dFEZdsIx
	ASuMsmitDv5BbMXk7Cd6ovemR8fhiT1XzzSB9+a2OS3tHAIE8xMSbiPGMhoHHTwp
	kQrgMGXdMbzaMXmWWKIEQuOFWlTfXQIEmJnNGmD/Tg==
X-ME-Sender: <xms:NZ1xZniFtWs-OO3GVUfE8iAUbiqH2UNVEzX2-Dauq5I5-_2UbUPN9A>
    <xme:NZ1xZkDAyVQSANWAGA6TuS6-beBdXzkdHTOJ2i_BHYjX3QmHEuvKnM62cpuztfMik
    2PY-QNFGE7igdKpeUE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedvkedgheduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:NZ1xZnGzAA_qS329TizHl7TVJ9KmtjbSuhTx9REnZz8dZNbat8gBmw>
    <xmx:NZ1xZkRZk7M4QONeziSVTZHvOj5cRDMZF2pQVsrCtcm6GR-onHElhA>
    <xmx:NZ1xZkze41blhsp0SQA07kW6bjnVJOh-Y7IgqVyI2n4H-BI8M5EzZg>
    <xmx:NZ1xZq6KtA-MXkZmvuQgdeMGoigkMz4mryPxa3nw1D02XqLVEyuqMQ>
    <xmx:NZ1xZvqQ-I3973rPcyXQ2bWBTvti1unvLKG-DSSUU-yXoD_y8u_Qoykt>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 42E78B60092; Tue, 18 Jun 2024 10:44:05 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-522-ga39cca1d5-fm-20240610.002-ga39cca1d
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <4e8f3cd6-de4f-492a-b1c0-8e0a356d2954@app.fastmail.com>
In-Reply-To: <20240614140421.3172674-2-peter.griffin@linaro.org>
References: <20240614140421.3172674-1-peter.griffin@linaro.org>
 <20240614140421.3172674-2-peter.griffin@linaro.org>
Date: Tue, 18 Jun 2024 16:43:45 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Peter Griffin" <peter.griffin@linaro.org>, "Lee Jones" <lee@kernel.org>,
 "Krzysztof Kozlowski" <krzk@kernel.org>,
 "Alim Akhtar" <alim.akhtar@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, "Tudor Ambarus" <tudor.ambarus@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 "Saravana Kannan" <saravanak@google.com>,
 "William McVicker" <willmcvicker@google.com>,
 "Sam Protsenko" <semen.protsenko@linaro.org>, kernel-team@android.com
Subject: Re: [PATCH 1/2] mfd: syscon: add of_syscon_register_regmap() API
Content-Type: text/plain

On Fri, Jun 14, 2024, at 16:04, Peter Griffin wrote:
> The of_syscon_register_regmap() API allows an externally created regmap
> to be registered with syscon. This regmap can then be returned to client
> drivers using the syscon_regmap_lookup_by_phandle() APIs.
>
> The API is used by platforms where mmio access to the syscon registers is
> not possible, and a underlying soc driver like exynos-pmu provides a SoC
> specific regmap that can issue a SMC or hypervisor call to write the
> register.
>
> This approach keeps the SoC complexities out of syscon, but allows common
> drivers such as  syscon-poweroff, syscon-reboot and friends that are used
> by many SoCs already to be re-used.
>
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>

Reviewed-by: Arnd Bergmann <arnd@arndb.de>
