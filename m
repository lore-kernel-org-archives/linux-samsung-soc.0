From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH 1/2] drm/exynos: remove DRM_EXYNOS_GEM_MAP_OFFSET ioctl
Date: Wed, 01 Oct 2014 17:13:26 +0200
Message-ID: <542C1A16.6030809@gmail.com>
References: <1410961726-2533-1-git-send-email-inki.dae@samsung.com>
 <1410961726-2533-2-git-send-email-inki.dae@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1410961726-2533-2-git-send-email-inki.dae@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Inki Dae <inki.dae@samsung.com>, dri-devel@lists.freedesktop.org
Cc: linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi Inki,

On 17.09.2014 15:48, Inki Dae wrote:
> This interface and relevant codes aren't used anymore.
> 

Hmm, I might be missing something, but after removing this IOCTL, how do
we obtain an offset to pass to mmap()?

Best regards,
Tomasz
