Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88CAB314B64
	for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Sep 2025 07:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758613935; cv=none; b=DI8P6z48rRAOYoy7j1ZYCAC5WbN/KEY2UX6lxNTbTtfgYaogWbGnphDil20oFgJ0U/cVnlDc22rzb9lz43h1iyCMPpbLY3K8X9toEwhKx4AvPBR0jL24WdYd920L0POdsKzp5eKcG/z60EgBgFXJSeJwGt/jzsEQR8YdTs0DIXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758613935; c=relaxed/simple;
	bh=pf37Q7wzChkdluFPqksV7e+I8FpVOZKjC6mV81x3yYY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=WJXEcFcst756XCn9Jkt/CD4Reo4ITTejwxGvKqmdL10vpvbGrpfyIhspowiP8svM60ZUIw6G6WLwWNAJYpVim3gZtredBIwNjesOKZgFxBHmQhD0QPz9uYkKc9MC8SfzrvMtFZvhhPmR27DmZNRs2HbqepdKSRTbTaUeZRrRoJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=O3vrN+cN; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="O3vrN+cN"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20250923075210euoutp01391ce3b9c53f235d9320d65a0f93a348~n2g1tonCx0202102021euoutp01m
	for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Sep 2025 07:52:10 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20250923075210euoutp01391ce3b9c53f235d9320d65a0f93a348~n2g1tonCx0202102021euoutp01m
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1758613930;
	bh=TyeXzWHqzkRrxRkI+OKjBSuJ/O2L9PTGBMWtdzDt3bI=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=O3vrN+cNTLDpjLQh55St7Mvpc9nHg7KXFF2fNi1yTNisFYaoMSbnhob3WsWV5z3wg
	 KgWx6X6gvJduDdpE2UTa+lExjuQ2BtnscWLx1TeopOhL8gS3HbRru+hZLNo46oBt8f
	 hI/EvZxZbG1vKxgoCZiRmiYagE8KT8QO51h5v6ZA=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250923075210eucas1p2e2268ea8465a10df505cf86110e51c3d~n2g1fGgch1074310743eucas1p2J;
	Tue, 23 Sep 2025 07:52:10 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250923075209eusmtip2088551d3840de5e4d012ae6fa85125ef~n2g08t4Xs2851428514eusmtip2V;
	Tue, 23 Sep 2025 07:52:09 +0000 (GMT)
Message-ID: <6d008809-c285-46d4-a604-6b34e4c73142@samsung.com>
Date: Tue, 23 Sep 2025 09:52:09 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [tip: sched/urgent] sched/deadline: Fix dl_server getting stuck
To: Peter Zijlstra <peterz@infradead.org>
Cc: linux-kernel@vger.kernel.org, linux-tip-commits@vger.kernel.org, John
	Stultz <jstultz@google.com>, x86@kernel.org, 'Linux Samsung SOC'
	<linux-samsung-soc@vger.kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20250923072506.GS3245006@noisy.programming.kicks-ass.net>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250923075210eucas1p2e2268ea8465a10df505cf86110e51c3d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250922215704eucas1p1f53a65a5cd1eafd3e0db006653231efd
X-EPHeader: CA
X-CMS-RootMailID: 20250922215704eucas1p1f53a65a5cd1eafd3e0db006653231efd
References: <20250916110155.GH3245006@noisy.programming.kicks-ass.net>
	<175817861820.709179.10538516755307778527.tip-bot2@tip-bot2>
	<CGME20250922215704eucas1p1f53a65a5cd1eafd3e0db006653231efd@eucas1p1.samsung.com>
	<e56310b5-f7a9-4fad-b79a-dcbcdd3d3883@samsung.com>
	<20250923072506.GS3245006@noisy.programming.kicks-ass.net>

On 23.09.2025 09:25, Peter Zijlstra wrote:
> On Mon, Sep 22, 2025 at 11:57:02PM +0200, Marek Szyprowski wrote:
>> On 18.09.2025 08:56, tip-bot2 for Peter Zijlstra wrote:
>>> The following commit has been merged into the sched/urgent branch of tip:
>>>
>>> Commit-ID:     077e1e2e0015e5ba6538d1c5299fb299a3a92d60
>>> Gitweb:        https://git.kernel.org/tip/077e1e2e0015e5ba6538d1c5299fb299a3a92d60
>>> Author:        Peter Zijlstra <peterz@infradead.org>
>>> AuthorDate:    Tue, 16 Sep 2025 23:02:41 +02:00
>>> Committer:     Peter Zijlstra <peterz@infradead.org>
>>> CommitterDate: Thu, 18 Sep 2025 08:50:05 +02:00
>>>
>>> sched/deadline: Fix dl_server getting stuck
>>>
>>> John found it was easy to hit lockup warnings when running locktorture
>>> on a 2 CPU VM, which he bisected down to: commit cccb45d7c429
>>> ("sched/deadline: Less agressive dl_server handling").
>>>
>>> While debugging it seems there is a chance where we end up with the
>>> dl_server dequeued, with dl_se->dl_server_active. This causes
>>> dl_server_start() to return without enqueueing the dl_server, thus it
>>> fails to run when RT tasks starve the cpu.
>>>
>>> When this happens, dl_server_timer() catches the
>>> '!dl_se->server_has_tasks(dl_se)' case, which then calls
>>> replenish_dl_entity() and dl_server_stopped() and finally return
>>> HRTIMER_NO_RESTART.
>>>
>>> This ends in no new timer and also no enqueue, leaving the dl_server
>>> 'dead', allowing starvation.
>>>
>>> What should have happened is for the bandwidth timer to start the
>>> zero-laxity timer, which in turn would enqueue the dl_server and cause
>>> dl_se->server_pick_task() to be called -- which will stop the
>>> dl_server if no fair tasks are observed for a whole period.
>>>
>>> IOW, it is totally irrelevant if there are fair tasks at the moment of
>>> bandwidth refresh.
>>>
>>> This removes all dl_se->server_has_tasks() users, so remove the whole
>>> thing.
>>>
>>> Fixes: cccb45d7c4295 ("sched/deadline: Less agressive dl_server handling")
>>> Reported-by: John Stultz <jstultz@google.com>
>>> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
>>> Tested-by: John Stultz <jstultz@google.com>
>>> ---
>> This patch landed in today's linux-next as commit 077e1e2e0015
>> ("sched/deadline: Fix dl_server getting stuck"). In my tests I found
>> that it breaks CPU hotplug on some of my systems. On 64bit
>> Exynos5433-based TM2e board I've captured the following lock dep warning
>> (which unfortunately doesn't look like really related to CPU hotplug):
> Absolutely wild guess; does something like this help?
>
> ---
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 18a30ae35441..bf78c46620a5 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -12972,6 +12972,8 @@ static void rq_offline_fair(struct rq *rq)
>   
>   	/* Ensure that we remove rq contribution to group share: */
>   	clear_tg_offline_cfs_rqs(rq);
> +
> +	dl_server_stop(&rq->fair_server);
>   }
>   
>   #ifdef CONFIG_SCHED_CORE

Unfortunately not, same log.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

