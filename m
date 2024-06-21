Received: from fout7-smtp.messagingengine.com (fout7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 570BA376E6;
	Fri, 21 Jun 2024 14:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718981718; cv=none; b=LSCmxf9YpF0BfB6esttPsjUC4eNv4rLsTa7onDQz9ZPklu6V+fD30uZwiNQvF8/1sDVcbzpL+I+5oLe+2Tf1UfgLRBv2S00/uuc/t1IMUa9NtztZanTcGJlVtcpURPKd84BZ8I7chk/wgelI/5j1qxzB6Cfq3u9Sv0j/BUcGMLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718981718; c=relaxed/simple;
	bh=sxeytMn3P0UopKZ0zgWdUBjCMQI0THXqqRrNiH9wB70=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=V6rw/naUnsKhfXHWBYSDtkD+kjLLyautH0PsywFZHN3fZsgJrayO74YXkKyceg51oNYdMYZeVpIOszG2fYnShf1q451ojqSkHervH5PmrI4Gwt/a0JL6Z6RHLr6bjgQHpD9ZDbAnyviJRx9Gvl0Do1cUBnTh2dvFI/QWl3CBHYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=fnBozDpe; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=eBckdUbU; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="fnBozDpe";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="eBckdUbU"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfout.nyi.internal (Postfix) with ESMTP id 6910B1380078;
	Fri, 21 Jun 2024 10:55:15 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Fri, 21 Jun 2024 10:55:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1718981715; x=1719068115; bh=QCQhqs9Lxj
	Ez+My8rJBf07IizwSx1QdzmUWTz96Xwo0=; b=fnBozDpeyyLOTYQf/Gbiy3073g
	OFtEwQlH2J1smoz7rmQc4wCYe0gEvAmBHvmUAv3OKYNG569WvoJsO6bz1hC3V4a+
	VCcpnkHJ1iEK17hVj8JgDlGU7DwRlyUFtP9fCYEFqJjnQ+fsQPs/P2BGgO+fGy7m
	ZFpxU9dgzQlAReV75zdfLQGsicgSukghyjP4RxT4I2owQvusQ0gH7qzgdTHFbH6Q
	6IAdbOqsM4p0c9c3j/qoPa2biGkbISqxumPPoQsfmf8nTiHk6kjsqxTLZZ+OWi5e
	VUOzl3eRqXd7M2Fjk5v9ppMZeVx/JxYvYrcS9WFHVB1nNdigBbHJfp6pUehQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1718981715; x=1719068115; bh=QCQhqs9LxjEz+My8rJBf07IizwSx
	1QdzmUWTz96Xwo0=; b=eBckdUbUoYNBrLkCoeyecwA+cTDBY5HSKxyMWllQeSW9
	l5DhZn/3gzpwDYcLQkJhNxk34Ptcc2ib3w0Dz5l2wReP9pLYjG1OoJWg7X+bNdBW
	2xKtq23abClfV7FvJF/TQwg02PkhzLmkWt4CuTQExlruwxlQ0ULqh7XhpL1UISj1
	q5h79k5ZUn6rCfpByEX4ZaxeSGM+ZpH34+ydPfi9/Wu65PzKrEAw74bslIfBKpc0
	/myHmmPvQX5u0A9gnnC14ZnMhShrNH8nbD9uIqzF/AoMvFzuecbxDVBeZDlmd6fH
	mtjylrljXAo6BrRKzEIZYk5MuumEEpoZtpQ8jdJe0g==
X-ME-Sender: <xms:UpR1Zk3p4lvPRJRJ0ALUapbUsglVUlveWtDqmjm_kQabtD3bDSGriA>
    <xme:UpR1ZvGfKh5FyS_kFfXdKXdqJbvNyGaiksGHs1_PEOsAO3-LLSyMH4A31T9Q-CpkZ
    v4ySDX36j4U1pugHfw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfeefgedgkeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:UpR1Zs73ZIs77XLlsi9cDiwbPxqMRUDFlwEKF5t8LlK8VLSp_7geLg>
    <xmx:UpR1Zt0CbGt_r89zl7UVGSJBtwmhPeN5g1JA5kA2L5sTjXmnlNu0MQ>
    <xmx:UpR1ZnGKj02ls4fywUWmkrEwhmL2XZJnFOpsvFUl55-jeMG1LBpHWA>
    <xmx:UpR1Zm8UkhvcsBwxSse4MoVLk_EhpCmc48PMR2kjZL_eV0wCy9efxg>
    <xmx:U5R1ZmdDPaDDlRTAflcdd4WU8wtbdU6iNkbrPVC-XLdvrpOi6gmRueG->
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id ACF14B6008D; Fri, 21 Jun 2024 10:55:14 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-522-ga39cca1d5-fm-20240610.002-ga39cca1d
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <6e7893f7-27f7-49bf-842f-d8e1c07cfeea@app.fastmail.com>
In-Reply-To: <20240621115544.1655458-1-peter.griffin@linaro.org>
References: <20240621115544.1655458-1-peter.griffin@linaro.org>
Date: Fri, 21 Jun 2024 14:54:54 +0000
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
Subject: Re: [PATCH v3 0/2] Add syscon of_syscon_register_regmap api
Content-Type: text/plain

On Fri, Jun 21, 2024, at 11:55, Peter Griffin wrote:

> Changes since v2:
>  - Move allocation outside spinlock area (Arnd)
> Link to v2:

Looks good to me now.

      Arnd
