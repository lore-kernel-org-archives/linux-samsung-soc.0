From: Ajay Kumar <ajaykumar.rs@samsung.com>
Subject: [RFC V2 0/3] drm/bridge: panel and chaining
Date: Tue, 06 May 2014 01:22:25 +0530
Message-ID: <1399319548-16567-1-git-send-email-ajaykumar.rs@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: joshi@samsung.com, ajaynumb@gmail.com, prashanth.g@samsung.com, Ajay Kumar <ajaykumar.rs@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

This patchset is based on exynos-drm-next-todo branch of Inki Dae's tree at:
git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git

I have just put up Rob's and Sean's idea of chaining up the bridges
in code, and have implemented basic panel controls as a chained bridge.
This works well with ptn3460 bridge chip on exynos5250-snow board.

Still need to make use of standard list calls and figure out proper way
of deleting the bridge chain. So, this is just a rough version.

Ajay Kumar (3):
  [RFC V2 1/3] drm: implement chaining of drm bridges
  [RFC V2 2/3] drm/bridge: add a dummy panel driver to support lvds bridges
  [RFC V2 3/3] drm/bridge: ptn3460: support bridge chaining

 .../bindings/drm/bridge/bridge_panel.txt           |  45 ++++
 drivers/gpu/drm/bridge/Kconfig                     |   6 +
 drivers/gpu/drm/bridge/Makefile                    |   1 +
 drivers/gpu/drm/bridge/bridge_panel.c              | 240 +++++++++++++++++++++
 drivers/gpu/drm/bridge/ptn3460.c                   |  21 +-
 drivers/gpu/drm/drm_crtc.c                         |  13 +-
 include/drm/bridge/bridge_panel.h                  |  37 ++++
 include/drm/drm_crtc.h                             |   2 +
 8 files changed, 360 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/drm/bridge/bridge_panel.txt
 create mode 100644 drivers/gpu/drm/bridge/bridge_panel.c
 create mode 100644 include/drm/bridge/bridge_panel.h

-- 
1.8.1.2
