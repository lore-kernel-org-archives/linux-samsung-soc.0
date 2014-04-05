From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v2 1/7] drm/exynos: add super device support
Date: Sat, 05 Apr 2014 21:01:33 +0200
Message-ID: <5340530D.5080707@gmail.com>
References: <1396355882-17010-1-git-send-email-inki.dae@samsung.com>
 <1396355882-17010-2-git-send-email-inki.dae@samsung.com>
 <533EB9C6.80302@samsung.com>
 <CAAQKjZPbzb+qvJA5y+Kco9BRv4j3iVatM_0bd+ugyuVZUbfFFg@mail.gmail.com>
 <53403E42.1010403@gmail.com> <20140405182423.GL7528@n2100.arm.linux.org.uk>
 <53404BF3.2010409@gmail.com> <20140405185249.GM7528@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20140405185249.GM7528@n2100.arm.linux.org.uk>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, dri-devel@lists.freedesktop.org, a.hajda@samsung.com, kyungmin.park@samsung.com, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On 05.04.2014 20:52, Russell King - ARM Linux wrote:
> On Sat, Apr 05, 2014 at 08:31:15PM +0200, Tomasz Figa wrote:
>> Maybe my words have been misinterpreted, but all I'm suggesting here is
>> that there is no need to add any new data to DT to solve the same issue
>> to the same extent as componentized subsystem framework, at least in
>> Exynos case.
>
> Right, so we seem to have agreement that what exynos is currently doing
> is fundamentally broken.
>
> So the next question is, how is it going to get fixed?
>

I believe this is a separate issue from what is being discussed in this 
thread, but anyway, I'd wait with this until Monday, so we could discuss 
this with Inki and Andrzej, who is the person responsible for Exynos DRM 
in my team. I was just passing by. ;)

Best regards,
Tomasz
